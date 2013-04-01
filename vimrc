""
"" Load pathogen first
""

if filereadable(expand("~/.vim/pathogen/autoload/pathogen.vim"))
  source ~/.vim/pathogen/autoload/pathogen.vim
  call pathogen#infect("~/.vim/bundles/colors")
  call pathogen#infect("~/.vim/bundles/utils")
  call pathogen#infect("~/.vim/bundles/syntaxes")
endif

""
"" Load custom config files
""

if filereadable(expand("~/.vim/settings.vim"))
  source ~/.vim/settings.vim
endif

if filereadable(expand("~/.vim/mappings.vim"))
  source ~/.vim/mappings.vim
endif
