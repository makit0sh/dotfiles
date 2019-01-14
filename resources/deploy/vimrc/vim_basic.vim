" basic settings

" turnoff vi compatibility if set
if !&compatible
  set nocompatible
endif

" basic settings
" based on github.com/tpope/vim-sensible

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set smartindent
set cindent
set backspace=indent,eol,start
set complete-=i

set smarttab
set shiftwidth=4
set tabstop=4
set shiftwidth=2
"set ambiwidth=double "disabled because airline broke

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set laststatus=2
set ruler
set number
set title
set wildmenu

set scrolloff=1
set sidescrolloff=5
set sidescroll=1
set display+=lastline

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
scriptencoding utf-8

" visualize unvisible characters
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
 set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~ 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

set hlsearch
if has('extra_search')
  set incsearch
endif
set smartcase

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

set showmatch
set matchtime=2

set mouse=a

set virtualedit=onemore " let cursor move to one character ahead
set whichwrap=b,s,h,l,<,>,[,]

" disable screen bell
set t_vb=
set novisualbell

