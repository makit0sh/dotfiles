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
$ ./init.sh $PLATFORM_NAME
```
This script will run init scripts for corresponding $PLATFORM_NAME.

### Build and deploy dotfiles
```
$ cd ~/dotfiles
$ ./deploy.sh $PLATFORM_NAME
```
This script will build dotfiles for corresponding $PLATFORM_NAME and creates symbolic links on your home directory.
Your former dotfiles will be renamed as backup.

