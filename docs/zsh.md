## ZSH or OH-MY-ZSH

I use oh-my-zsh as my default shell.

### Setup

Mac OSX has zsh included, for linux, install zsh first:

```bash
$ sudo apt-get install zsh
```

Then install oh-my-zsh:

```bash
$ curl -L http://install.ohmyz.sh | sh
```

Change the default shell to zsh:

```bash
$ chsh -s /bin/zsh
```

I have created my own zsh theme, however the official repo does not accept PR anymore, so I have to put it in this repo. To install:

```bash
$ ./install-configs.sh
# it will install txchen.zsh-theme and .zshrc
```

### my.zshrc

I have defined these aliases:

* f = 'find . | grep --color'
* godir = 'cd ~/gocode/src/github.com/txchen'

I use these plugins:
* Mac: git osx z vagrant brew golang colored-man
* Linux: git z ssh-agent golang colored-man

To switch directory, `z` is really awesome.

And I puth machine specific settings into `~/.zshenv`

### Features of txchen.zsh-theme

* Super fast git/hg branch showing
* Show exit code if it was not zero
* Random hostname color in prompt, based on md5 hash
