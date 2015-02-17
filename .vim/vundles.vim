" Vundle setup!
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" non-GitHub repos

Plugin 'git@github.com:tomasr/molokai.git'
Plugin 'git@github.com:tpope/vim-fugitive.git'

Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'git@github.com:bling/vim-airline.git'
Plugin 'git@github.com:airblade/vim-gitgutter.git'
Plugin 'git@github.com:mhinz/vim-signify.git'

Plugin 'git@github.com:klen/python-mode.git'

Plugin 'git@github.com:terryma/vim-multiple-cursors.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
