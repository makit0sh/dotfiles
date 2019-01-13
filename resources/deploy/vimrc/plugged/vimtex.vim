" vimtex setting

let g:vimtex_compiler_latexmk_engines = {'_' : '-pdfdvi'}

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

