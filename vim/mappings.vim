""
"" Leader key
""
let mapleader = ","

""
"" General Mappings
""   nmap: Normal mode: When typing commands
""   vmap: Visual mode: When typing when the Visual area is highlighted
""   omap: Operator-pending mode: When an operator is pending (after 'd', 'y', ...)
""   imap: Insert mode: When editing (also used in replace mode)
""   cmap: Command-line mode: When entering a ':' or '/' command
""   map: Normal, Visual+Select, Operator pending
""   for special cases (xmap, smap, lmap) see here:
""     http://vimdoc.sourceforge.net/htmldoc/map.html#mapmode-o
""

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <leader>p :set invpaste<CR>:set paste?<CR>
imap <leader>p <ESC>:set invpaste<CR>:set paste?<CR>

" Toggle text wrapping
nmap <leader>tw :set invwrap<CR>:set wrap?<CR>

" Clear search highlight
nmap <leader>hs :nohlsearch<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" Open in window
map <leader>ew :e %%
" Open in split
map <leader>es :sp %%
" Open in vertical split
map <leader>ev :vsp %%
" Open in tab
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" format the entire file
nmap <leader>fef ggVG=

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Indenting & Outdenting
" while keeping the original selection in visual mode
vmap <C-l> >gv
vmap <C-h> <gv

nmap <C-l> >>
nmap <C-h> <<

imap <C-l> <Esc>>>i
imap <C-h> <Esc><<i

" Bubble single lines (works with the unimpaired plugin)
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines (works with the unimpaired plugin)
vmap <C-k> [egv
vmap <C-j> ]egv

" Buffer manipulation
" match <C-Left, Right and Down on iTerm2 in terminal compatible keybindings mode)
map [1;5D :bprev<CR>
map [1;5C :bnext<CR>
map [1;5B  :bdelete<CR>

""
"" Bundles custom mappings
""

" Ack (grep-like text finder)
nmap <leader>f :Ack<space>

" Fugitive (git)
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" NERDCommenter (remap toggle comments from <leader>c space to <leader>/)
nmap <leader>/ <plug>NERDCommenterToggle<CR>
vmap <leader>/ <plug>NERDCommenterToggle<CR>
imap <leader>/ <ESC><plug>NERDCommenterToggle<CR>i

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" Tabular
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
