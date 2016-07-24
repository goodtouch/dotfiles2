""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Edition
""
set nowrap                        " don't wrap lines
filetype plugin indent on         " Auto indent

" 80 characters indication
set textwidth=80
set colorcolumn=+1

" Whitespaces
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.


""
"" Vim configuration
""

if has("autocmd")
" After writting buffer, if file name is .vimrc, reload the file to apply changes
  autocmd bufwritepost vimrc source $MYVIMRC
endif

""
"" Color Scheme
""

if (has("termguicolors"))
  set termguicolors
endif
" FIXME: remove or find a truecolor version of solarized
" let g:solarized_termcolors=256
" Disable Background Color Erase (Fix vim background in tmux)
set t_ut=
set background=dark
colorscheme gruvbox
" colorscheme one


""
"" Airline
""
let g:airline_powerline_fonts=1            " Enable powerline fonts
let g:airline#extensions#tabline#enabled=1 " Display the list of buffers
set laststatus=2                           " Always display the status line

""
"" The Silver Searcher
""
let g:ackprg = 'ag --vimgrep'                                   " Use Ag over Ack
set grepprg=ag\ --nogroup\ --nocolor                            " Use Ag over Grep
let g:ctrlp_user_command='ag -Q -l --nocolor --hidden -g "" %s' " Use ag in CtrlP. Lightning fast and respects .gitignore
let g:ctrlp_use_caching=0                                       " ag is fast, CtrlP doesn't need to cache
