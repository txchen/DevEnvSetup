# VSCode settings

## Installed extensions:

* Atom One Dark Theme
* C#
* EditorConfig
* ESlit
* Go
* jumpy
* Prettier-Standard
* vetur

## Sync my settings

Ext repo: https://github.com/nonoroazoro/vscode-syncing

Create gist access token, then upload / download settings.

## My keybindings:

Based on windows default key bindings, added/updated some of my own preferences.

### Disabled ones:
* ctrl+i (use ctrl+l instead)
* shift+alt+a (use this to select to cursorHome)
* ctrl+f3 (use alt+f3 instead, easier to trigger)
* ctrl+w (workbench.action.closeWindow, close window is too risky)
* ctrl+shift+w (close window is too risky)
* ctrl+l l (I need ctrl+l)
* ctrl+r (open other directory not so useful, use this as go to symbol)

### Added ones:
| Key  | Description  | Note  |
|---|---|---|
| alt+a | cursor move to the begining of line | |
| alt+shift+a | select to the beginning of line | |
| alt+e | cursor move to the end of line | |
| alt+shift+e | select to the end of line | |
| ctrl+shift+w | reopen closed editor | |
| alt+f | cursor word right | faster than move right, similar to emacs alt+f |
| alt+b | cursor word left | faster than move left, similar to emacs alt+b |
| alt+f3 | go to next for current selection | if no selection, current word will be selected. |
| ctrl+l | select line | |
| alt+h | Go to previous editor in group | like navigate tab in tmux |
| alt+l | Go to next editor in group | like navigate tab in tmux |
| alt+j | Go to right region (group or sidebar) | no cycle, does not split editor |
| alt+k | Go to left group (group or sidebar) | no cycle, does not split editor |
| alt+d | cursor pageDown | like ctrl+d in vim |
| alt+u | cursor pageUp | like ctrl+u in vim |
| ctrl+r | go to symbol in current file | |

### Useful default ones
| Key  | Description  | Note  |
|---|---|---|
| **VSCODE Specific** | | |
| ctrl+p or ctrl+e | quick open file | |
| ctrl+shift+p or f1 | show all commands | |
| **markdown** | | |
| ctrl+shift+v | show markdown preview | |
| ctrl+k, v | open markdown preview side by side | |
| **VSCODE navigation** | | |
| ctrl+0 | focus sidebar | |
| ctrl+b | toggle sidebar | |
| ctrl+1 | focus first group | |
| ctrl+2 | focus second group | |
| ctrl+3 | focus third group | |
| ctrl+` | toggle terminal | |
| ctrl+j | toggle panel | |
| ctrl+\ | split editor | |
| ctrl+shift+e | view explorer | |
| ctrl+shift+g | view git window | |
| ctrl+shift+f | view search window | |
| ctrl+shift+d | view debug window | |
| ctrl+w | close active editor | |
| ctrl+k, enter | keep the temp opening file in editor | |
| f8 | go to next warning or error | |
| shift+f8 | go to previous warning or error | |
| ctrl+alt+left | move editor to left group | |
| ctrl+alt+right | move editor to right group | |
| **In editor navigation** | | |
| alt+left | navigate back | |
| alt+right | navigate forword | |
| ctrl+g | go to line | |
| ctrl+t | search and go to symbol in workspace | |
| ctrl+shift+[ | fold code | |
| ctrl+shift+] | unfold code | |
| ctrl+k ctrl+0 | fold all | |
| ctrl+k ctrl+j | unfold all | |
| **basic editing** | | |
| ctrl+enter | insert line after | |
| ctrl+shift+enter | insert line before | |
| ctrl+/ | toggle comment | |
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
| ctrl+k ctrl+f | format selection | |
| f2 | rename | |
| f12 | go to declaration | |
| alt+f12 | preview declaration | |
| shift+f12 | reference search | |
