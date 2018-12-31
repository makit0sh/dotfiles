# dotfiles

Dotfile manager and generator for UNIX-base platforms.

Currently available platforms:
- Mac OS X
- Ubuntu
- Gentoo
- Arch Linux

## How to install

The installation step requires git.
Run the following command.

```
$ cd ~
$ git clone https://github.com/makit0sh/dotfiles
```

## Initialize
```
$ cd ~/dotfiles
$ export PLATFORM_NAME=your_platform_name
$ make init
```
These command will run init scripts for corresponding $PLATFORM_NAME.

### Build and deploy dotfiles
```
$ cd ~/dotfiles
$ export PLATFORM_NAME=your_platform_name
$ make deploy
```
This script will build dotfiles for corresponding $PLATFORM_NAME and creates symbolic links on your home directory.
Your former dotfiles will be renamed as backup.

### Removal
```
$ cd ~/dotfiles
$ make clean
```
These command will remove all deployed symbolic links on your home directory and remove build.
