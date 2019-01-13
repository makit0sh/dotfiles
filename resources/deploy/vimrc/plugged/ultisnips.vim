" setting for UltiSnips


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-K>"
let g:UltiSnipsJumpForwardTrigger="<C-B>"
let g:UltiSnipsJumpBackwardTrigger="<C-Z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" directory for custom snippets
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" filetypes
autocmd FileType plaintex UltiSnipsAddFiletypes tex.plaintex

