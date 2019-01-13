" vim-plug setting
" https://github.com/junegunn/vim-plug

" automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir ~/.vim/plugged
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'w0rp/ale'
Plug 'junegunn/fzf'

Plug 'lervag/vimtex'

Plug 'rhysd/clever-f.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'LeafCage/yankround.vim'
Plug 'tpope/vim-commentary'

Plug 'vim-scripts/xml.vim'
Plug 'mattn/emmet-vim'

" initialize plugin system
call plug#end()

