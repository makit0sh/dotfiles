DOTFILES_EXCLUDES := .DS_Store .git .gitignore .gitmodules
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

#init: deploy
#	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
#
#update:
#	@$(foreach val, $(wildcard ./etc/update/*.sh), bash $(val);)

