call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0ng/vim-hybrid'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'ervandew/supertab'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Raimondi/delimitMate'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neco-vim'
" Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-jedi'
Plug 'mhinz/vim-startify'

Plug 'rizzatti/dash.vim'

" Plug 'Shougo/context_filetype.vim'
" Plug 'Shougo/neopairs.vim '
" Plug 'Shougo/echodoc.vim'

call plug#end()

" let g:hybrid_custom_term_colors = 1
" set background=dark
" colorscheme hybrid
" let g:airline_theme='hybrid'

set termguicolors

set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'

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

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

nmap <silent> <leader>d <Plug>DashSearch
