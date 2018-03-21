call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-two-firewatch'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

set termguicolors

" set background=dark
" colorscheme jellybeans
" let g:airline_theme="jellybeans"

" set background=dark " or light if you prefer the light version
" set background=light " or light if you prefer the light version
" let g:two_firewatch_italics=1
" colo two-firewatch
" 
" let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" let g:airline_theme="ayu"

colorscheme nova
let g:airline_theme="nova"

if has('gui_running')
  set guifont=Source\ Code\ Pro:h12
endif

set number

set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start

set history=1000
set backup
set noswapfile

set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

if has('persistent_undo')
  set undofile
  set undoreload=10000
  set undodir=~/.vim/tmp/undo/     " undo files
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
endif

set autoindent
set smartindent

set incsearch
set ignorecase
set smartcase

set noshowmode
set hidden

autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType make setlocal noexpandtab

let mapleader="\<Space>"

set wildmenu
set wildmode=list:longest
" Latex ignores
set wildignore+=*.aux,*.log,*.bbl,*.pdf,*.out,*.blg,
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
