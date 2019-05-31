" basic keymaps

" turn ; into : for US keyboard
" nnoremap ; :

nnoremap tt :tabnew<CR>
nnoremap Y y$
" double tap v to select till line end
vnoremap v $h

" behave naturally in wrapped sentences
" nnoremap j gj
" nnoremap k gk
" nnoremap <Down> gj
" nnoremap <Up> gk

" change window size by arrows
nnoremap <C-w><Left> <C-w><<CR>
nnoremap <C-w><Right> <C-w>><CR>
nnoremap <C-w><Up> <C-w>-<CR>
nnoremap <C-w><Down> <C-w>+<CR>

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

inoremap <C-U> <C-G>u<C-U>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" quickly open active file with %%
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
