## iTerm2

### Setup

* Change the color, download [this](https://github.com/txchen/DevEnvSetup/blob/master/iterm/monokai_soda.itermcolors), Profiles -> Default -> Colors -> Load Presets
* Make it transparent: Profiles -> Default -> Window -> Transparency
* Change font: 13pt Monaco, Anti-aliased
* Use `cmd + h` / `cmd + l` to switch tab, add these two in Keys settings
* In Keys, map `shift + enter` to `Send ✠`, because VIM cannot map shift + enter, use another special character to work around, so that it can be used in vimrc
* Change the default size bigger
* Change left/right option key acts as `+ESC`, Profiles -> Default -> Keys, then Alt key mapping can work well
* Change scroll back line to 9999 or bigger, Profiles -> Default -> Terminal
* Set terminal type to `xterm-256color`, Profiles -> Default -> Terminal
* Set Preference -> General -> Applications in terminal may access clipboard. This will let tmux be able to access system clipboard.
