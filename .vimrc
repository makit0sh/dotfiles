" Prepare .vim dir
let s:vimdir = $HOME . "/.vim"
if has("vim_starting")
  if ! isdirectory(s:vimdir)
    call system("mkdir " . s:vimdir)
    call system("mkdir " . s:vimdir . "/undo")
    call system("mkdir " . s:vimdir . "/swp")
    call system("mkdir " . s:vimdir . "/backup")
  endif
endif

"colorscheme
"molokai
":set t_Co=256
":colorscheme molokai 

"solarized
":let g:solarized_termcolors=256
":let g:solarized_termtrans=1
":set background =dark
":colorscheme solarized

"hybrid
"set background=dark
"colorscheme hybrid

" vi compatibility
if !&compatible
  set nocompatible
endif

"
" dein settings {{{
"
"Flag
let s:use_dein = 1

let s:dein_enabled = 0
if s:use_dein && v:version >= 704
    let s:dein_enabled = 1

    " dein.vimのディレクトリ
    let s:dein_dir = s:vimdir . '/dein'
    let s:dein_github = s:dein_dir . '/repos/github.com'
    let s:dein_repo_name = "Shougo/dein.vim"
    let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name

    " なければgit clone
    if !isdirectory(s:dein_repo_dir)
        echo "dein is not installed, install now "
        let s:dein_repo = "https://github.com/" . s:dein_repo_name
        echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
        call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
    endif
    let &runtimepath = &runtimepath . "," . s:dein_repo_dir

    if dein#load_state(s:dein_dir)
        call dein#begin(s:dein_dir)

        " 管理するプラグインを記述したファイル
        let s:toml = '~/.dein.toml'
        let s:lazy_toml = '~/.dein_lazy.toml'
        call dein#load_toml(s:toml, {'lazy': 0})
        call dein#load_toml(s:lazy_toml, {'lazy': 1})

        call dein#end()
        call dein#save_state()
    endif
    " プラグインの追加・削除やtomlファイルの設定を変更した後は
    " 適宜 call dein#update や call dein#clear_state を呼んでください。
    " そもそもキャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。

    " その他インストールしていないものはこちらに入れる
    if dein#check_install()
        call dein#install()
    endif
endif
" }}}

" quickrun {{{
if s:dein_enabled && dein#tap("vim-quickrun")
    let g:quickrun_config = get(g:, 'quickrun_config', {})
    let g:quickrun_config._ = {
                \ 'runner'    : 'vimproc',
                \ 'runner/vimproc/updatetime' : 60,
                \ 'outputter' : 'error',
                \ 'outputter/error/success' : 'buffer',
                \ 'outputter/error/error'   : 'quickfix',
                \ 'outputter/buffer/split'  : ':rightbelow 8sp',
                \ 'outputter/buffer/close_on_empty' : 1,
                \ }
    let g:quickrun_config['tex'] = {
                \ 'command' : 'latexmk',
                \ 'outputter' : 'error',
                \ 'outputter/error/success' : 'null',
                \ 'outputter/error/error' : 'quickfix',
                \ 'srcfile' : expand("%"),
                \ 'cmdopt': '-pv',
                \ 'hook/sweep/files' : [
                \                      '%S:p:r.aux',
                \                      '%S:p:r.bbl',
                \                      '%S:p:r.blg',
                \                      '%S:p:r.dvi',
                \                      '%S:p:r.fdb_latexmk',
                \                      '%S:p:r.fls',
                \                      '%S:p:r.log',
                \                      '%S:p:r-blx.bib',
                \                      '%S:p:r.synctex.gz',
                \                      '%S:p:r.run.xml',
                \                      '%S:p:r.out',
                \                      '%S:p:r.toc'
                \                      ],
                \ 'exec': '%c %o %a %s',
                \}
    " 部分的に選択してコンパイル
    let g:quickrun_config.tmptex = {
                \   'exec': [
                \           'mv %s %a/tmptex.latex',
                \           'latexmk -pv -output-directory=%a %a/tmptex.latex',
                \           ],
                \   'args' : expand("%:p:h:gs?\\\\?/?"),
                \   'outputter' : 'error',
                \   'outputter/error/error' : 'quickfix',
                \
                \   'hook/eval/enable' : 1,
                \   'hook/eval/cd' : "%s:r",
                \
                \   'hook/eval/template' : '\documentclass[dvipdfmx,uplatex]{jsarticle}'
                \                         .'\usepackage[dvipdfmx]{graphicx, hyperref}'
                \                         .'\usepackage{float}'
                \                         .'\usepackage{amsmath,amssymb,amsthm,ascmac,mathrsfs}'
                \                         .'\begin{document}'
                \                         .'%s'
                \                         .'\end{document}',
                \
                \   'hook/sweep/files' : [
                \                      '%S:p:r.aux',
                \                      '%S:p:r.bbl',
                \                      '%S:p:r.blg',
                \                      '%S:p:r.dvi',
                \                      '%S:p:r.fdb_latexmk',
                \                      '%S:p:r.fls',
                \                      '%S:p:r.log',
                \                      '%S:p:r-blx.bib',
                \                      '%S:p:r.synctex.gz',
                \                      '%S:p:r.run.xml',
                \                      '%S:p:r.out',
                \                      'tmptex.aux',
                \                      'tmptex.bbl',
                \                      'tmptex.blg',
                \                      'tmptex.dvi',
                \                      'tmptex.fdb_latexmk',
                \                      'tmptex.fls',
                \                      'tmptex.log',
                \                      'tmptex-blx.bib',
                \                      'tmptex.synctex.gz',
                \                      'tmptex.run.xml',
                \                      'tmptex.out',
                \                      'tmptex.latex',
                \                      'tmptex.pdf'
                \                        ],
                \}
    "TODO キーマップ
    vnoremap <silent><buffer> <Leader>ll :QuickRun -mode v -type tmptex<CR>
    nnoremap <silent><Leader>ll :QuickRun<CR>
    nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
    "texファイル保存時の挙動
    augroup latexautocompile
        autocmd!
        autocmd BufWritePost *.{tex} :QuickRun
    augroup END
endif
" }}}
" grep {{{
if s:dein_enabled && dein#tap('grep.vim')
    nnoremap <expr> gr ':Rgrep<CR>'
    let Grep_Skip_Dirs = '.svn .git'  "無視するディレクトリ
    let Grep_Default_Options = '-I'   "バイナルファイルがgrepしない
    let Grep_Skip_Files = '*.bak *~'  "バックアップファイルを無視する
    if executable('jvgrep')
        set grepprg=jvgrep
    endif
endif
" }}}
" airline {{{
if s:dein_enabled && dein#tap('vim-airline') && dein#tap('vim-airline-themes')
    "set guifont=Roboto\ Mono\ for\ Powerline\ 12
    "let g:airline_powerline_fonts = 1
    let g:airline_theme = 'hybrid'
endif
"}}}
" yankround {{{
if s:dein_enabled && dein#tap('yankround.vim')
    nmap p <Plug>(yankround-p)
    xmap p <Plug>(yankround-p)
    nmap P <Plug>(yankround-P)
    nmap gp <Plug>(yankround-gp)
    xmap gp <Plug>(yankround-gp)
    nmap gP <Plug>(yankround-gP)
    nmap <C-p> <Plug>(yankround-prev)
    nmap <C-n> <Plug>(yankround-next)
endif
" }}}
" neocomplete {{{
if s:dein_enabled && dein#tap('neocomplete')
    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 1
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    NeoCompleteEnable
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
" }}}

" neosnipet {{{
if s:dein_enabled && dein#tap('neosnippet')
    " Plugin key-mappings.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    imap <expr><TAB>
     \ pumvisible() ? "\<C-n>" :
     \ neosnippet#expandable_or_jumpable() ?
     \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    "if has('conceal')
    "  set conceallevel=2 concealcursor=niv
    "endif
endif
" }}}
" emmet {{{
if s:dein_enabled && dein#tap('emmet-vim')
    let g:use_emmet_complete_tag = 1
    let g:user_emmet_settings = {
                \ 'lang' : 'ja',
                \ 'html' : {
                \   'indentation' : '  '
                \ }}
endif
" }}}
" syntastic {{{
if s:dein_enabled && dein#tap('syntastic')
   set statusline+=%#warningmsg#
   set statusline+=%{SyntasticStatuslineFlag()}
   set statusline+=%*

   let g:syntastic_always_populate_loc_list = 1
   let g:syntastic_auto_loc_list = 1
   let g:syntastic_check_on_open = 1
   let g:syntastic_check_on_wq = 0
endif
" }}}
" vimshell {{{
if s:dein_enabled && dein#tap('vimshell.vim')
    "nmap <silent> vs :<C-u>VimShell<CR>
    "nmap <silent> vp :<C-u>VimShellPop<CR>
    "シェルを起動
    nnoremap <silent> ,s :VimShell<CR>
    nnoremap <silent> ,p :VimShellPop<CR>
    "pythonを非同期で起動
    nnoremap <silent> ,py :VimShellInteractive python<CR>
    "irbを非同期で起動
    nnoremap <silent> ,rb :VimShellInteractive irb<CR>
    "luaを非同期で起動
    nnoremap <silent> ,lu :VimShellInteractive lua<CR>
    "非同期で開いたインタプリタに現在の行を評価させる
    vmap <silent> ,ss :VimShellSendString<CR>
    "選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
    nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
    " Use current directoy as vimshell prompt.
    let g:vimshell_prompt_expr =
                \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
    let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
endif
" }}}
" vimfiler {{{
if s:dein_enabled && dein#tap("vimfiler.vim")
    "vimデフォルトのエクスプローラをvimfilerで置き換える
    let g:vimfiler_as_default_explorer = 1
    "セーフモードを無効にした状態で起動する
    let g:vimfiler_safe_mode_by_default = 0
    "現在開いているバッファのディレクトリを開く
    nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
    "現在開いているバッファをIDE風に開く
    nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
endif
" }}}
" tagbar {{{
if s:dein_enabled && dein#tap('tagbar')
    nmap <silent> <Leader>tb :TagbarToggle<CR>
endif

"general settings
syntax on
filetype plugin indent on
"set nocompatible
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set list
set listchars=tab:>-,trail:.
set display=lastline
set pumheight=10
set showmatch
set matchtime=2
set mouse=a
set incsearch
set wildmenu wildmode=list:full
set virtualedit=onemore "let cursor move to everywhere
set ruler
scriptencoding utf-8
set showcmd
set ignorecase
set smartcase
set hlsearch
"set nohlsearch
set cindent
set laststatus=2
"set cursorline
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,,[,]
set scrolloff=8
set sidescrolloff=16
set sidescroll=1
" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

"backup dirs
set backup
set writebackup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swp
if has('persistent_undo')
    set undodir=$HOME/.vim/undo
    set undofile
endif

if has("autocmd")
    "最後に開いていた時のカーソル位置を保存する
    augroup vimrcEx
        au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
                    \ exe "normal g`\"" | endif
    augroup END
    "quickfix を自動で開く
    augroup QuickFixCmd
        autocmd!
        autocmd QuickFixCmdPost *grep* cwindow
    augroup END
endif
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

"keymaps
nnoremap tt :tabnew<CR>
nnoremap Y y$
nnoremap ; :
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" vを二回で行末まで選択
vnoremap v $h
" Ctrl + hjkl でウィンドウ間を移動
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
"日本語入力便利マップ
nnoremap <Down> gj
nnoremap <Up>   gk
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
" ""の中身を変更する
nnoremap し” ci"
" ''の中身を変更する
nnoremap し’ ci'
" jjでエスケープ
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>

"カーソルラインが重かったから調整
"http://thinca.hatenablog.com/entry/20090530/1243615055
"2017-11-20
augroup vimrc-auto-cursorline
    autocmd!
    autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
    autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
    autocmd WinEnter * call s:auto_cursorline('WinEnter')
    autocmd WinLeave * call s:auto_cursorline('WinLeave')

    let s:cursorline_lock = 0
    function! s:auto_cursorline(event)
        if a:event ==# 'WinEnter'
            setlocal cursorline
            let s:cursorline_lock = 2
        elseif a:event ==# 'WinLeave'
            setlocal nocursorline
        elseif a:event ==# 'CursorMoved'
            if s:cursorline_lock
                if 1 < s:cursorline_lock
                    let s:cursorline_lock = 1
                else
                    setlocal nocursorline
                    let s:cursorline_lock = 0
                endif
            endif
        elseif a:event ==# 'CursorHold'
            setlocal cursorline
            let s:cursorline_lock = 1
        endif
    endfunction
augroup END
