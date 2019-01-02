" quickfix settings

if has("autocmd")
  augroup QuickFixCmd
	autocmd!
	autocmd QuickFixCmdPost *grep* cwindow
  augroup END
endif

