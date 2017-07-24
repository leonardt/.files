call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0ng/vim-hybrid'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'

Plug 'roxma/nvim-completion-manager'
Plug 'roxma/python-support.nvim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'roxma/clang_complete'

Plug 'mhinz/vim-startify'

Plug 'rizzatti/dash.vim'

call plug#end()

" let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
let g:airline_theme='hybrid'

set termguicolors

" set background=light
" colorscheme PaperColor
" let g:airline_theme='papercolor'

set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start

set history=1000
set backup
set noswapfile

set backupdir=~/.nvim/tmp/backup/
set directory=~/.nvim/tmp/swap/

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

if has('persistent_undo')
  set undofile
  set undoreload=10000
  set undodir=~/.nvim/tmp/undo/     " undo files
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
endif


set autoindent
set smartindent
set hidden

set incsearch
set ignorecase
set smartcase

set noshowmode
set hidden

autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType make setlocal noexpandtab

let mapleader="\<Space>"
tnoremap <Esc> <C-\><C-n>
" Latex ignores
set wildignore+=*.aux,*.log,*.bbl,*.pdf,*.out,*.blg

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

nmap <silent> <leader>d <Plug>DashSearch

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:clang_library_path="/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"

au FileType c,cpp  nmap gd <Plug>(clang_complete_goto_declaration)

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Use environment Python
let g:python_support_python2_venv = 0
let g:python_support_python3_venv = 0

" Python Completion
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')

" language specific completions on markdown file
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')

" utils, optional for nvim-completion-manager
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')
