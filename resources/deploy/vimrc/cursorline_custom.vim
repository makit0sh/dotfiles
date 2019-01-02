" settings regarding cursorline
if has("autocmd")
  " remember last cursor position
  augroup vimrcEx
	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
		  \ exe "normal g`\"" | endif
  augroup END

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

endif

