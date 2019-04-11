" setting for taketwo/vim-ros

let g:ycm_semantic_triggers = {
	  \   'roslaunch' : ['="', '$(', '/'],
	  \   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
	  \ }
