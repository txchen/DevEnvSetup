## ZSH

### my.zshrc

I have defined these aliases:

* f = 'find . | grep --color'
* godir = 'cd ~/gocode/src/github.com/txchen'

I use these plugins:
* Mac: git osx z brew golang colored-man
* Linux: git z ssh-agent golang colored-man

To switch directory, `z` is really awesome.

And I puth machine specific settings into `~/.zshenv`

### Features of txchen.zsh-theme

* Super fast git/hg branch showing
* Show exit code if it was not zero
* Random hostname color in prompt, based on md5 hash
