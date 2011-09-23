filetype plugin indent on 		" Automatically detect file types.
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible 	" We don't want vi compatibility.
colorscheme solarized
set background=dark
syntax enable		" enable syntax highlighting
set bs=indent,eol,start " allow backspacing over everything in insert mode
set viminfo='20,\"50 	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50 		" keep 50 lines of command line history
set ruler 		" show the cursor position all the time
set tabstop=2		" set tab width = 4
set expandtab
set shiftwidth=2
set showcmd
set number
set showmatch 		" Show matching brackets.
set mouse=a 		" Enable mouse usage (all modes) in terminals
let mapleader=","

map ,d :execute 'NERDTreeToggle ' .getcwd()<CR>

" Code folding
"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview


" Search & Replace
set hlsearch   " highlight searches
set ignorecase " make searches case-insensitive, unless they contain upper-case letters:
set smartcase
set incsearch  " show the `best match so far' as search strings are typed:
"set gdefault   " assume the /g flag on :s substitutions to replace all matches in a line:
"set enc=utf-8  " UTF-8 Default encoding'


" Kill trailing whitespace from documents on save
" autocmd BufWritePre * :%s/\s\+$//e

" Remap space to :
noremap <space> :

" Scrolling
no J 20j
no K 20k

" Disable the arrow keys so you're
" forced to scroll like a man
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Splits
set splitbelow " :sp => open split BELOW
set splitright " :vsp => open vsplit on RIGHT

"   Correct some spelling mistakes    "
ia teh      the
ia htis     this
ia tihs     this
ia funciton function
ia fucntion function
ia funtion  function
ia retunr   return
ia reutrn   return
ia sefl     self
ia eslf     self


" gist.vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1


" ,F to startup an ack search
map <Leader>f :Ack<space>

map <Leader>s :ConqueTermSplit zsh --login<cr>

" gist.vim
" Copy gist url to clipboard when adding
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'echo %URL% | pbcopy'

map <Leader>gco :GitCheckout<space>


" Window Jumping
map <C-J> <C-W>j<15C-W>_
map <C-K> <C-W>k<15C-W>
map <C-h> <C-W>h<15C-W>_
map <C-l> <C-W>l<15C-W>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"snipmate setup

" source ~/.vim/bundle/snipmate-snippets/support_functions.vim
let g:SuperTabDefaultCompletionType = "context"
