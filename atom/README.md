### Keymap setting

To make atom in Mac work like in windows, use my custom keymap.cson.

It is copied from these files
- atom https://github.com/atom/atom/blob/master/keymaps/win32.cson
- command-palette https://github.com/atom/command-palette/blob/master/keymaps/command-palette.cson
- fuzzy-finder https://github.com/atom/fuzzy-finder/blob/master/keymaps/fuzzy-finder.cson
- find-and-replace https://github.com/atom/find-and-replace/blob/master/keymaps/find-and-replace.cson
- symbols-view https://github.com/atom/symbols-view/blob/master/keymaps/symbols-view.cson
- bookmarks https://github.com/atom/bookmarks/blob/master/keymaps/bookmarks.cson
- custom setting for vim mode
- custom setting for jumpy

### The packages I install
- atom-beautify
- editorconfig
- git-blame
- go-plus
- highlight-selected
- jumpy
- last-cursor-position
- project-manager

### Hotkeys

| Key | Description | Note |
|-----|-------------|------|
| **Moving** | | |
| alt-b, alt-left | Move to beginning of word | |
| alt-f, alt-right | Move to end of word | |
| alt-a | Move to first char of line | TODO |
| alt-e | Move to end of line | TODO |
| ctrl-r | Find symbols in current file | |
| ctrl-shift-r | Find symbols in project | Requires ctag |
| **Bookmark** | | |
| ctrl-f2 | Toggle bookmark | |
| ctrl-shift-f2 | Clear all bookmarks | |
| f2, shift-f2 | Cycle through bookmarks | |
| **Selection** | | |
| ctrl-l | select current line | |
| **Editing** | | |
| ctrl-k ctrl-u | Upper case current word or selection | |
| ctrl-k ctrl-l | Lower case current word or selection | |
| ctrl-shift-d | Duplicate the current line |
| ctrl-up ctrl-down | Move current line up or down | |
| ctrl-shift-k | Delete current line | |
| ctrl-k | Cut to end of line | |

## TODO

- Add doc about important keymap
- write a plugin to replace jumpy
- config for golang writing
- tune split commands
