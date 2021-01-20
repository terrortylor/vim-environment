local api = vim.api

local M = {}

M.result_buf = nil

function M.clear_result_buf()
  api.nvim_buf_set_lines(
  M.result_buf,
  0,
  api.nvim_buf_line_count(M.result_buf),
  false,
  {}
  )
end

function M.add_lines(lines)
  local buf_start = api.nvim_buf_line_count(M.result_buf)
  local buf_end = buf_start

  -- An empty buffer still had 1 line
  if buf_start == 1 then
    buf_start = 0
  end

  api.nvim_buf_set_lines(M.result_buf, buf_start, buf_end, false, lines)
end

function M.update_result_buf(requests)
  M.clear_result_buf()

  for _,req in pairs(requests) do
    M.add_lines({
      '#######################',
      req:get_title()
    })
    M.add_lines(req:get_results())
    M.add_lines({
      '',
    })

  end
end

function M.show_status(hl_running, hl_complete, is_running, size, complete, missing_data, failed)
  local print_status = function(hl, msg)
    api.nvim_command("echohl " .. hl)
    api.nvim_command("echo '" .. msg .. "'")
    api.nvim_command("echohl None")
  end

  local status
  local hl
  local state

  if is_running then
    state = "Running"
    hl = hl_running
  else
    state = "Finished"
    hl = hl_complete
  end

  status =  string.format("%s: %s of %s complete", state, complete, size)

  if missing_data > 0 then
    status = status .. string.format(", %s missing data", missing_data)
  end

  if failed > 0 then
    status = status .. string.format(", %s failed", failed)
  end
  print_status(hl,status)
end

-- TODO rename to create_http_result_buf
function M.create_result_scratch_buf()
  if M.result_buf then
    M.clear_result_buf(true)
  else
    -- create unlisted scratch buffer
    M.result_buf = api.nvim_create_buf(false, true)
    api.nvim_buf_set_option(M.result_buf, "filetype", "httpresult")
    -- TODO set not modifiable
  end
end

return M