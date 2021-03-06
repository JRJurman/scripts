" Jesse's Vim config
" Based on various other configs

" the following is a patch so that vim does not freak out on fish
if $SHELL =~ 'fish'
  set shell=/bin/bash
endif

set number 		" show line numbers
syntax on  		" syntax highlighing
set autoindent		" Start new lines on the same indent as previous
filetype indent plugin on

set tabstop=2
set shiftwidth=2
set expandtab
"set bs=2           " odd cygwin backspace mapping

autocmd FileType markdown set nofoldenable
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.sj set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown

"set nowrap         " don't wrap lines
set ruler           " show the cursor position all the time
set nocompatible    " use vim defaults, not vi defaults
set cindent         " automatically indent inner blocks of code in C
set ignorecase      " Ignore case when searching
set showmatch       " Show matching braces when text indicator is over them
set noerrorbells    " No sound on errors
"set novisualbell   " No sound via the visual bell
set history=500     " Remember tons of commands (default is 20)
set showmode		    " Show the mode you are currently in
set cc=80           " set color column at 80
set wildmenu        " enable colon auto-complete
filetype on         " Enable filetype detection
set hlsearch        " Highlight search results
set incsearch       " Makes search act like search in modern browsers

"map shift-* to move 10 steps
noremap J 10j
noremap K 10k
noremap H 10h
noremap L 10l

"remap j and k to move through wrapped lines
"noremap k gk
"noremap j gj

"ctrlp options
set runtimepath^=~/.vim/bundle/ctrlp.vim

"set background=dark
colorscheme Tomorrow-Night-Bright
