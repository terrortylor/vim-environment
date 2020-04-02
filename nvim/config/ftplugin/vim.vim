" Highlights function block
" TODO turn this into a object so can then do multiple levels
nnoremap <leader>vf ?function<cr>v/endfunction<cr>$

" echo's selection on line bellow
xnoremap <leader>ev yoechom '": ' . "

" Populates a location list with the functions in the current file
nnoremap <leader>lf :call LocationListFromPattern('^\(\s*\)\=function!\=.*(.*)\( abort\)\=$')<cr>
" command! -nargs=0 ListFunctions call LocationListFromPattern('^\(\s*\)\=function!\=.*(.*)\( abort\)\=$')

" TODO customise the fold line
set foldmethod=expr
set foldexpr=FoldVimFunctions(v:lnum)

" Folds top level functions
" including functions that are commented out
function! FoldVimFunctions(line)
	let func_start = '\v^(")=(\s)?fun(ction)='
	let func_end = '\v^(")=(\s)?endfun(ction)='
	let str = getline(a:line)

	if str =~ func_start
		return '>1'
	elseif str =~ func_end
		return '<1'
	else
		if a:line > 1
			let prev_line = getline(a:line - 1)
			if prev_line =~ func_end
				return 0
			endif
		endif
		return foldlevel(a:line - 1)
	endif
endfunction
