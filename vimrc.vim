" ------------------------------------------------------------------------
" -----------------------------   vimrc   --------------------------------
" ------------------------------------------------------------------------

" ------------------------------- System ---------------------------------
" ------------------------------------------------------------------------
" Enable pathogen
call pathogen#infect()
call pathogen#helptags()

" Set map leader
let mapleader = ','

" Includes
if has("win32")
    " Add extra filetypes
    source ~/vimfiles/filetypes.vim
    " Extra helper functions
    source ~/vimfiles/functions.vim
else
    " Add extra filetypes
    source ~/.vim/filetypes.vim
    " Extra helper functions
    source ~/.vim/functions.vim
endif

" ------------------------------- General --------------------------------
" ------------------------------------------------------------------------
" Make Vim more useful than Vi
set nocompatible

" Increase history size
set history=1000

" Allow changing of buffers without saving
set hidden

" Set the directory of the swap file
" The // indicates that the swap name should be globally unique
set directory=~/.vim/tmp//,/tmp

" Enable backup files and specify backup directories
set backupdir=~/.vim/backup/,/tmp
set backup

" Enable undo
set undodir=~/.vim/undo
set undofile

" Enable viminfo file, and create autocmd to restore file
" position between edits
set viminfo='10,<100,:20,%

function! ResCur()
    if line("'\"") < line("$")
        normal! g'"
        return 1
    endif
endfunction

autocmd BufReadPost * call ResCur()

" Use the bash shell
set shell=/bin/bash

" Use UTF-8 for internal text
set encoding=utf-8

" Try the following EOL formats when opening a new file
set fileformats=unix,dos,mac

" Automatically insert comment leader
set formatoptions=q

" Do not redraw while running macros
set lazyredraw

" ------------------------------- Editing --------------------------------
" ------------------------------------------------------------------------
" Make backspace more flexible
set backspace=eol,start,indent

" Turn on file-dependent features like syntax highlighting
" and indentation
syntax enable
filetype plugin on
filetype indent on

" Set the tab stop to the given value and enable tab-to-space expansion
set tabstop=4
set shiftwidth=4
set expandtab

" Make sure that <BS> deletes a "shiftwidth" worth of spaces
set smarttab

" Make the indent carry to the next line
set autoindent

" Make sure that <BS> deletes a "shiftwidth" worth of spaces
set smarttab

" Make the indent carry to the next line
set autoindent

" Jump to the corresponding brace when inserting closing braces
" for the given time, in tenths of a second
set showmatch
set matchtime=3

" ------------------------------ Interface -------------------------------
" ------------------------------------------------------------------------
" Set options for GUI vs shell
if has("gui_running")
    " Disable the toolbar
    set guioptions-=T

    " Set theme options
    colorscheme molokai
    set background=dark
else
    " Enable more colors for the terminal
    set t_Co=256

    " Set theme options
    colorscheme earendel
    set background=dark
endif

" Turn on Wild Menu for command completion
set wildmenu

" Set the title to be more meaningful
set title

" Keep the screen neat by not wrapping long lines
set nowrap

" Set whitespace characters to use when using list
set listchars=eol:¶,tab:»­,trail:·

" Enable an warning when exceeding 80 characters
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Enable line numbers
set number

" Show the line and column numbers
set ruler

" Increase height of Vim command prompt
set cmdheight=2

" Enable status line for all files
set laststatus=2

" Set the status line to show useful information
set statusline=\ %F%m%r%h\ %w\ \ [%{&ff}]%y\ Line:\ %l/%L:%c\ (%p%%)

" Always report number of lines modified
set report=0

" Maintain a certain number of lines between the cursor
" and the end of the window
set scrolloff=7

" ------------------------------ Searching -------------------------------
" ------------------------------------------------------------------------
" Ignore case in searching by default, unless there are capitals
set ignorecase
set smartcase

" Match searches immediately, and highlight subsequent matches
set incsearch
set hlsearch

" ------------------------------ Mappings --------------------------------
" ------------------------------------------------------------------------
" Map list command
nmap <leader>l :set list!<CR>

" Map navigation commands
nmap <C-Y> 5k
nmap <C-E> 5j

" Map CTRL+L to clear highlight search
map <silent> <C-L> :silent nohlsearch<CR>

" Map CTRL+Backspace to delete words in insert mode
imap <C-BS> <C-W>

" Map CTRL+Delete to delete words in front of the cursor in insert mode
imap <C-Del> <C-[>dawi

" Map CTRL+S to select all
nmap <C-S> ggVG

" Map CTRL+P, CTRL+X and CTRL+Y for clipboard register paste and copy operations
nmap <C-P> "+gp
imap <C-P> <ESC><C-P>a
vmap <C-X> "+d
vmap <C-Y> "+y
vmap <C-P> "+gP

" Replace the backtick with the apostrophe, for better accessibility
nnoremap ' `
nnoremap ` '

" Map Enter and Shift-Enter to insert newlines below and above the cursor
nmap <CR> o<Esc>0d$
nmap <S-CR> O<Esc>0d$

" Make the arrow keys useful
nmap <silent> <down> <ESC>:bn<CR>
nmap <silent> <up> <ESC>:bp<CR>
nmap <silent> <left> <ESC>:NERDTreeToggle<CR>
nmap <silent> <right> <ESC>:Tlist<CR>

" ------------------------------- Plugins --------------------------------
" ------------------------------------------------------------------------
" NERDCommenter
let NERDSpaceDelims=1

" ------------------------ Environment-Specific --------------------------
" ------------------------------------------------------------------------
if has("win32")
    " Fix shell options
    set shell=cmd.exe
    set shellcmdflag=/C

    " Specify swap directory
	set directory=~/vimfiles/tmp//,$TMP

	" Specify backup directory
	set backupdir=~/vimfiles/backup/,$TMP

	" Specify undo directory
	set undodir=~/vimfiles/undo

	" Fix font
	set guifont=Consolas:h10:b:cANSI
endif

