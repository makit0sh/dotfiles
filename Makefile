BUILD_DIR		:= $(PWD)/build
CONFIG_DIR		:= $(PWD)/config
RESOURCE_DIR	:= $(PWD)/resources
SCRIPT_DIR		:= $(PWD)/scripts
DOTFILES_DIR	:= $(PWD)

RM	:= rm -rf

target			:= $$PLATFORM_NAME
TARGET_PATH		:= $(HOME)

.PHONY: build
build:
	@sh $(SCRIPT_DIR)/build.sh $(target) $(BUILD_DIR) $(CONFIG_DIR) $(RESOURCE_DIR) $(SCRIPT_DIR)

.PHONY: init
init:
	@sh $(SCRIPT_DIR)/init.sh $(target) $(BUILD_DIR) $(CONFIG_DIR) $(RESOURCE_DIR) $(SCRIPT_DIR)

.PHONY: deploy
deploy:
	@make build
	@echo linking dotfiles into home directory...
	@sh $(SCRIPT_DIR)/deploy.sh $(BUILD_DIR) $(SCRIPT_DIR) $(TARGET_PATH)

.PHONY: clean
clean:
	@echo removing symbolic links...
	@sh $(SCRIPT_DIR)/remove_links.sh $(BUILD_DIR) $(SCRIPT_DIR) $(TARGET_PATH)
	@echo removing build directory...
	$(RM) $(BUILD_DIR)

