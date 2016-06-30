My development environment settings
===========
[VSCode](#vscode)

## Installation
```bash
curl -L http://install.ohmyz.sh | sh
mkdir -p ~/GithubCode
cd ~/GithubCode
git clone https://github.com/txchen/DevEnvSetup.git
cd DevEnvSetup
./install-configs.sh
```

## VSCODE

Installed extensions:

* C#
* ESlit
* One Dark Theme
* Editor config
* vue
* toml

My keybindings (custom and useful ones):

| Key  | Description  | Note  |
|---|---|---|
| **VSCODE Specific** | | |
| ctrl+p or ctrl+e | quick open file | |
| ctrl+shift+p or f1 | show all commands | |
| **markdown** | | |
| ctrl+shift+v | toggle markdown preview | |
| ctrl+k, v | open markdown preview side by side | |
| **VSCODE navigation** | | |
| ctrl+0 | focus sidebar | |
| ctrl+b | toggle sidebar | |
| ctrl+1 | focus first editor | |
| ctrl+2 | focus second editor | |
| ctrl+3 | focus third editor | |
| ctrl+` | toggle terminal | |
| ctrl+j | toggle panel | |
| alt+j  | open next working file  | cycle through working files  |
| alt+k  | open previous working file  |   |
| alt+l  | go to right editor | can be used to split editor |
| alt+h  | go to left editor | |
| ctrl+shift+e | view explorer | |
| ctrl+shift+g | view git window | |
| ctrl+shift+f | view search window | |
| ctrl+shift+d | view debug window | |
| ctrl+w | close active editor | |
| ctrl+k, enter | add to working files | |
| ctrl+k, w | close file | will remove from working files |
| f8 | go to next warning or error | |
| shift+f8 | go to previous warning or error | |
| **In editor navigation** | | |
| alt+a  | cursor move to the begining of line |  |
| alt+e  | cursor move to the end of line | |
| alt+w  | cursor word right | faster than move right |
| alt+b  | cursor word left | faster than move left |
| alt+left | navigate back | |
| alt+right | navigate forword | |
| ctrl+g | go to line | |
| ctrl+r | go to symbol in current file | |
| ctrl+t | search and go to symbol in workspace | |
| alt+f3 | go to next for current selection | if no selection, current word will be selected. |
| **basic editing** | | |
| ctrl+enter | insert line after | |
| ctrl+shift+enter | insert line before | |
| ctrl+/ | toggle comment | |
| ctrl+l | select line | |
| ctrl+shift+k | delete lines |
| ctrl+] | indent lines | |
| ctrl+[ | outdent lines | |
| alt+down | move lines down | |
| alt+up | move lines up | |
| **advanced language editing** | | |
| shift+f10 | show context menu | |
| shift+alt+right | smart select grow | |
| shift+alt+left | smart select shrink | |
| ctrl+shift+space | trigger parameter hints | |
| ctrl+space | trigger suggestion | |
| alt+shift+f | format code | |
| f2 | rename | |
| f12 | go to declaration | |
| alt+f12 | preview declaration | |
| shift+f12 | reference search | |
