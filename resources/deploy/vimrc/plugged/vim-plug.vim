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
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/clever-f.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'LeafCage/yankround.vim'
Plug 'tpope/vim-commentary'
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'pseewald/vim-anyfold'
Plug 'arecarn/vim-fold-cycle'

Plug 'lervag/vimtex', {'for': ['tex']}

Plug 'vim-scripts/xml.vim', {'for': ['xml']}
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}

"Plug 'kovisoft/paredit', {'for': ['lisp', 'scheme', 'clojure']}
Plug 'jiangmiao/auto-pairs', {'for': ['lisp', 'scheme', 'clojure']}

" initialize plugin system
call plug#end()

