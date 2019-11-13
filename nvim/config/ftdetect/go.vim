augroup goftgroup
  autocmd BufRead,BufNewFile *.go set filetype=go
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
augroup END

set errorformat =%-G#\ %.%#                   " Ignore lines beginning with '#' ('# command-line-arguments' line sometimes appears?)
set errorformat+=%-G%.%#panic:\ %m            " Ignore lines containing 'panic: message'
set errorformat+=%Ecan\'t\ load\ package:\ %m " Start of multiline error string is 'can\'t load package'
set errorformat+=%A%f:%l:%c:\ %m              " Start of multiline unspecified string is 'filename:linenumber:columnnumber:'
set errorformat+=%A%f:%l:\ %m                 " Start of multiline unspecified string is 'filename:linenumber:'
set errorformat+=%C%*\\s%m                    " Continuation of multiline error message is indented
set errorformat+=%-G%.%#                      " All lines not matching any of the above patterns are ignored
