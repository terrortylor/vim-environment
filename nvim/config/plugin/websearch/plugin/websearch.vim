" Inspired by this post:
" https://www.reddit.com/r/vim/comments/ebaoku/function_to_google_any_text_object/
if exists('g:loaded_websearch_plugin')
  finish
endif
let g:loaded_websearch_plugin = 1

if !exists('g:websearch_include_filetype')
 let g:websearch_include_filetype = 1
endif

if !exists('g:websearch_browser')
 let g:websearch_browser = 'chrome'
endif

if !exists('g:websearch_search_engine')
 let g:websearch_search_engine = 'google'
endif
