# Dot Files

These are config files to set up a system the way I like it.

# Installation

``` bash
git clone git://github.com/goodtouch/dotfiles2 ~/.dotfiles
cd .dotfiles
rake install
```

# Environments

I'm running on Mac OS X and Linux Debian.

# Inspiration

This mainly comes from Ryan Bates Dot Files (http://github.com/ryanb) and from a lot of other sources.
I'll try to list them all here:

## General

- http://github.com/ryanb

## tmux

## vim

### Useful commands

- Use `:%s/to_repace/replace_by/g` to perform a find & replace in the file

### Cheat sheet wallpapers

- Keyboard [cheat sheet](http://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png)
- Vim [movement shortcuts wallpaper](http://naleid.com/blog/2010/10/04/vim-movement-shortcuts-wallpaper/)

### Customizations

- `<leader>ew` expands to `:e (directory of current file)/` (open in the current buffer)
- `<leader>es` expands to `:sp (directory of current file)/` (open in a horizontal split)
- `<leader>ev` expands to `:vsp (directory of current file)/` (open in a vertical split)
- `<leader>et` expands to `:tabe (directory of current file)/` (open in a new tab)
- `:w!!` expands to `%!sudo tee > /dev/null %`. Write to the current file using sudo (if you forgot to run it with sudo), it will prompt for sudo password when writing
- `<leader>p` toggles paste mode
- `<leader>fef` formats the entire file
- `<leader>cd` changes the path to the active buffer's file
- `<leader>md` creates the directory of the active buffer's file (For example, when editing a new file for which the path does not exist.)
- `<leader>ul` underlines the current line with =
- `<leader>tw` toggles wrap
- `<leader>fc` finds the next conflict marker (tested with Git conflicted files)
- Remap `<Down>` and `<Up>` to `gj` and `gk` (Wrapped text is not considered a single long line of text.)
- `<leader>hs` toggles highlight search
- `<leader>=` adjusts viewports to the same size (<C-w>=)
- `<C-l>` shifts current line or selected lines rightwards (indent)
- `<C-h>` shifts current line or selected lines leftwards (outdent)
- `<C-k>` bubbles current line or selected lines upwards
- `<C-l>` bubbles current line or selected lines downwards

### Plugins

#### Fuzzy finder (CtrlP)

Fuzzy file, buffer, mru, and tag finder.

#### Comments (NERDCommenter)

NERDCommenter allows you to wrangle your code comments, regardless of filetype. View `:help NERDCommenter` for all the details.

**Customizations:**

- `<leader>/` toggles comments

#### File explorer (NERDTree)

NERDTree is a file explorer plugin that provides "project drawer" functionality to your vim projects. You can learn more about it with `:help NERDTree`.

**Customizations:**

- `<leader>n` toggle explorer

#### Git support (Fugitive)

Fugitive adds pervasive git support to git directories in vim. For more information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or unstage it.
Type `p` on a file to enter `git add -p` and stage specific hunks in the file.

**Customizations:**

- `<leader>gb` maps to `:Gblame<CR>`
- `<leader>gs` maps to `:Gstatus<CR>`
- `<leader>gd` maps to `:Gdiff<CR>`
- `<leader>gl` maps to `:Glog<CR>`
- `<leader>gc` maps to `:Gcommit<CR>`
- `<leader>gp` maps to `:Git push<CR>`

#### Zoom Windows (ZoomWin)

When working with split windows, ZoomWin lets you zoom into a window and out again using `<C-w> o`
