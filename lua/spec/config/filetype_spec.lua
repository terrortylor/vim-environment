local testModule
local mock = require('luassert.mock')
local stub = require('luassert.stub')
local api

describe('config.filetype', function()
  before_each(function()
    api = mock(vim.api, true)
    testModule = require('config.filetype')
  end)

  after_each(function()
    mock.revert(api)
  end)

  describe('open_ftplugin_file', function()
    it('Should print message if filetype not set', function()
      -- Setup stubbed values
      api.nvim_buf_get_option.on_call_with(0, "filetype").returns("")
      stub(_G, 'print')
      api.nvim_buf_line_count.on_call_with(0).returns(0)

      testModule.open_ftplugin_file()

      assert.stub(_G.print).was_called_with('Filetype not set')
      assert.stub(api.nvim_eval).was_not_called()

      _G.print:revert()
    end)

    it('Should open filetype file if filetype set', function()
      -- Setup stubbed values
      stub(vim, "cmd")
      api.nvim_buf_get_option.on_call_with(0, "filetype").returns("lua")
      api.nvim_eval.on_call_with("expand('$MYVIMRC')").returns("/home/user/.config/nvim/init.vim")

      testModule.open_ftplugin_file()

      assert.stub(api.nvim_eval).was_called()
      assert.stub(vim.cmd).was_called_with("edit /home/user/.config/nvim/ftplugin/lua.lua")
    end)
  end)
end)
