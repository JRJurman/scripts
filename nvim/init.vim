" Jesse's Vim config
" Based on various other configs

" PLUGIN MAGIC ===============================================================
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'scrooloose/nerdtree'		" show me files in a directory
Plug 'chriskempson/vim-tomorrow-theme'	" make my vim shiny
Plug 'tpope/vim-sleuth'			" indent based on relative files
Plug 'ctrlpvim/ctrlp.vim'		" search for files by name
Plug 'Shougo/deoplete.nvim'		" auto-complete
Plug 'pangloss/vim-javascript'		" syntax magic for javascript
Plug 'mxw/vim-jsx'			" syntax magic for jsx
Plug 'rking/ag.vim'			" search for content inside project
Plug 'airblade/vim-gitgutter'		" show git content inside vim

call plug#end()
" PLUGIN MAGIC IS OVER =======================================================

colorscheme Tomorrow-Night-Eighties
set number 		" show line numbers
syntax on  		" syntax highlighing
set nocompatible	" be iMproved, required
set nowrap		" don't wrap lines
set ruler		" show the cursor position all the time
set history=500		" Remember tons of commands (default is 20)
set ignorecase		" Ignore case when searching
set cc=80		" set color column at 80
set cursorline		" highlight the current line (use the settings below)
hi CursorLineNr cterm=bold ctermfg=12
set autoindent		" Start new lines on the same indent as previous

"set noerrorbells    " No sound on errors
"set novisualbell   " No sound via the visual bell
"filetype on         " Enable filetype detection
"set incsearch       " Makes search act like search in modern browsers

"map shift-* to move 10 steps
noremap J 10j
noremap K 10k
noremap H 10h
noremap L 10l

" navigate between panes using alt
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" resize vim windows easily
" can't do <A-l> because of chromebook shortcuts
tnoremap <A-H> <C-\><C-n>:vertical resize +1<CR>A
tnoremap <A-J> <C-\><C-n>:res +1<CR>A
tnoremap <A-K> <C-\><C-n>:res -1<CR>A
tnoremap <A-:> <C-\><C-n>:vertical resize -1<CR>A
nnoremap <A-H> :vertical resize +1<CR>
nnoremap <A-J> :res +1<CR>
nnoremap <A-K> :res -1<CR>
nnoremap <A-:> :vertical resize -1<CR>

" split windows using \ and -
" one day I'll figure this out

" tab navigation
nnoremap <A-T> :tabnew +term<CR>
nnoremap <A-N> :tabnew<CR>
nnoremap <A-{> :tabprev<CR>
nnoremap <A-}> :tabnext<CR>
tnoremap <A-T> :tabnew +term<CR>
tnoremap <A-{> :tabprev<CR>
tnoremap <A-}> :tabnext<CR>

" leave terminal to nvim
tnoremap <Esc><Esc> <C-\><C-n>

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Ag search
nnoremap <A-f> :Ag 

" CTRLP search
nnoremap <A-p> :CtrlP<CR>

" NERD TREE CONFIGS
" open nerd tree when no other files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open nerd tree with key binding
map <A-e> :NERDTreeToggle<CR>
