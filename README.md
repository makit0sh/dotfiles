# dotfiles

OS X dotfiles.

## How to install
The installation step requires the brew and git.

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install git
```

Run the following command.

```
$ cd ~
$ git clone https://github.com/makit0sh/dotfiles
```

## Initialize
```
$ cd ~/dotfiles
$ make init
```
This command deploys symbolic links and runs init scripts.

## Deploy dotfiles
```
$ cd ~/dotfiles
$ make deploy
```
This command deploys symbolic links.

