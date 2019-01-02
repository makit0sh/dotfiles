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

"backup dirs
set backup
set writebackup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swp
if has('persistent_undo')
    set undodir=$HOME/.vim/undo
    set undofile
endif

