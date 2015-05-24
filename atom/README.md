### Packages
- atom-beautify
- editorconfig
- go-plus
- highlight-selected
- jumpy
- last-cursor-position
- project-manager

To install:

```
apm install `cat packages.list`
```

To generate packages.list:

```
apm list --installed --bare > packages.list
```

### Keymap setting

To make atom in Mac work like in windows, use my custom keymap.cson.

It is copied from these files
- atom https://github.com/atom/atom/blob/master/keymaps/win32.cson
- command-palette https://github.com/atom/command-palette/blob/master/keymaps/command-palette.cson
- fuzzy-finder https://github.com/atom/fuzzy-finder/blob/master/keymaps/fuzzy-finder.cson
- find-and-replace https://github.com/atom/find-and-replace/blob/master/keymaps/find-and-replace.cson
- symbols-view https://github.com/atom/symbols-view/blob/master/keymaps/symbols-view.cson
- bookmarks https://github.com/atom/bookmarks/blob/master/keymaps/bookmarks.cson

### Hotkeys

| Key | Description | Note |
|-----|-------------|------|
| **Command palette** | | |
| ctrl-shift-p | Toggle command palette | same as sublime |
| **Fuzzy finder** | | |
| ctrl-b | Toggle file finder - opened files only | |
| ctrl-shift-b | Toggle git status finder | |
| ctrl-p | Toggle file finder | same as sublime |
| **Switching** | | |
| alt-h, alt-l | Switch to previous/next buffer | Like iTerm2 |
| alt-j, alt-k | Switch to next/previous pane | Like tmux |
| **Moving** | | |
| alt-b, alt-left | Move to beginning of word | |
| alt-f, alt-right | Move to end of word | |
| alt-a | Move to first char of line | TODO |
| alt-e | Move to end of line | TODO |
| ctrl-- | Move to previous cursor position | VS Navigate Backward, TODO |
| ctrl-_ | Move ot next cursor position | VS Navigate Forward, TODO |
| ctrl-r | Find symbols in current file | |
| ctrl-shift-r | Find symbols in project | Requires ctag |
| f12 | Go to declaration | Requires ctag |
| ctrl-f12 | Return from declaration | Requires ctag |
| **Bookmark** | | |
| alt-f2 | Toggle bookmark | |
| ctrl-f2 | View all bookmarks | |
| ctrl-alt-f2 | Clear all bookmarks | |
| f2, shift-f2 | Cycle through bookmarks | |
| **Find and replace** | | |
| ctrl-f | Toggle find in current buffer | |
| ctrl-shift-f | Toggle find in current project | |
| ctrl-h | Toggle replace in current buffer | |
| f3, shift-f3 | Find next, previous | |
| alt-f3 | Select all in find context | |
| ctrl-d | Select next | can be used as 'select current word' |
| ctrl-e | Use selection as find pattern | |
| ctrl-u | Select undo | |
| alt-enter | Select all in find window | |
| **Selection** | | |
| ctrl-l | select current line | |
| ctrl-shift-a | Select from start of the line to current | |
| ctrl-shift-e | Select from current to end of line | |
| **Editing** | | |
| ctrl-k ctrl-u | Upper case current word or selection | |
| ctrl-k ctrl-l | Lower case current word or selection | |
| ctrl-shift-d | Duplicate the current line |
| ctrl-up ctrl-down | Move current line up or down | |
| ctrl-shift-k | Delete current line | |
| ctrl-k | Cut to end of line | |
| **Folding** | |
| ctrl-alt-[ ctrl-alt-] | Fold/unfold current row | |
| ctrl-alt-shift-[, ctl-alt-shift-] | Fold/unfold all | |
| **Pane** | |
| ctrl-k arrow | Split pane, up down left right | |
| ctrl-k ctrl-w | Close pane | |
| **Misc** | | |
| ctrl-0 | Go to/Go back from tree view | |
| ctrl-j | Join lines | |
| ctrl-/ | Toggle comment | |
| ctrl-shift-d | Duplicate current line | |
| ctrl-enter | New line below | |
| ctrl-shift-enter | New line above | |
| ctrl-shift-, | Scroll to cursor position | |
| ctrl-[, ctrl-] | Indent/outdent selected rows | |
| **Plugins** | | |
| ctrl-alt-b | Atom beautify | |
| ctrl-shift-m | Toggle markdown preview | |
| ctrl-alt-p | Switch project | project-manager |

## TODO

- write a plugin to replace jumpy and last-cursor-position
