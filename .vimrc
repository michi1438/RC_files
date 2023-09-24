filetype on
filetype plugin on
filetype indent on
syntax on
colorscheme meta5 

set nocompatible
set hidden
set noswapfile

set incsearch
set hlsearch
set ignorecase
set smartcase

set number
set relativenumber

set nocursorcolumn
"set colorcolumn=80
set cursorline

set shiftwidth=4
set softtabstop=4
set tabstop=4
set formatoptions-=ro " for return in commented sections

set showcmd
set showmode
set showmatch

set nowrap

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['norminette', 'gcc', 'g++']
let g:syntastic_aggregate_errors = 1

" Set the path to norminette (do no set if using norminette of 42 mac)
let g:syntastic_c_norminette_exec = 'norminette'

" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']

" include dirs cpp
let g:syntastic_cpp_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']
let g:syntastic_cpp_compiler_options = ' -std=c+98 -Werror -Wall -Wextra'
let g:syntastic_cpp_auto_refresh_includes = 1

" Pass custom arguments to norminette (this one ignores 42header)
let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'

" Check errors when opening a file (disable to speed up startup time)
let g:syntastic_check_on_open = 1

" Active or passive file types...
let g:syntastic_mode_map = {
	\ "mode": "active",
	\ "active_filetypes": ["C", "C++"],
	\ "passive_filetypes": ["md"] }

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:user42 = 'mguerga'
let g:mail42 = 'mguerga@42lausanne.ch'

let g:NERDTreeGitStatusIdicatorMapCustom = {
			\ 'Modified'	:'✹',
			\ 'Staged'	:'✚',
			\ 'Untracked'	:'✭',
			\ 'Renamed'	:'➜',
			\ 'Unmerged'	:'═',
			\ 'Deleted'	:'✖',
			\ 'Dirty'		:'✗',
			\ 'Ignored'	:'☒',
			\ 'Clean'		:'✔︎',
			\ 'Unknown'	:'?',
			\ }

" PLUGINS ----------------------------------------------------------{{{
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree' |
		  \ Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'xbeheydt/42-vim-stdheader'
	Plug 'ggVGc/vim-fuzzysearch'
	Plug 'vim-syntastic/syntastic'
	Plug 'alexandregv/norminette-vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'rafi/awesome-vim-colorschemes'

call plug#end()
" Plugin code goes here.

" }}}

" MAPPINGS ---------------------------------------------------------{{{
inoremap hh <esc>
let mapleader = "\\"
nnoremap <leader>\ ``
nnoremap <space> :
nnoremap zz :w<CR>

nnoremap o o<esc>
nnoremap O O<esc>
nnoremap <c-z> <nop>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap J 5j
nnoremap K 5k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <F1> :NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeFind<cr>
inoremap <F1> <esc>:NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeFind<cr>
nnoremap <F3> :Files<cr>
inoremap <F3> <esc>:Files<cr>
nnoremap <F4> :mks! ~/Session.vim <cr>
inoremap <F4> <esc>:mks! ~/Session.vim <cr>
inoremap <c-w> <esc><c-w>
nnoremap <c-w>s :vertical ter<cr>
tnoremap <F1> <c-\><c-n>
tnoremap <F2> <c-\><c-n>:vertical ter<cr>

let NERDTreeIgnore =['\.o$','\.a$', '\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\,db$']

" Mappings code goes here. 
"
" }}}

" VIMSCRIPT --------------------------------------------------------{{{
"
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END

if version >= 703
set undodir=~/.vim/backup
set undofile
set undoreload=10000
endif

"	start nerdtree when vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"	Automatically close a tab if the only remaining window is NerdTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd BufWritePost *.c silent !ctags -R .

" Automatically load the session when entering vim
" autocmd! VimEnter * if argc() == 0 && !exists("s:std_in") | source ~/Session.vim | endif

" More Vimscripts code goes here.

" }}}

" STATUS LINE --------------------------------------------------------{{{

"Status bar code goes here.

" }}}


