call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'cocopon/iceberg.vim'
" Plug 'nanotech/jellybeans.vim'
" Plug 'morhetz/gruvbox'
" Plug 'mhartington/oceanic-next'
" Plug 'w0ng/vim-hybrid'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'junegunn/seoul256.vim'
" Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'rakr/vim-two-firewatch'
" Plug 'ayu-theme/ayu-vim'
"
" Plug 'sheerun/vim-polyglot'
" Plug 'trevordmiller/nova-vim'

Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'dikiaap/minimalist'
Plug 'reedes/vim-colors-pencil'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'

Plug 'ruanyl/vim-gh-line'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'vim-python/python-syntax'
Plug 'sheerun/vim-polyglot'

" Plug 'w0rp/ale'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Plug 'mhinz/vim-startify'

" Plug 'rizzatti/dash.vim'
Plug 'mhinz/neovim-remote'
" Plug 'easymotion/vim-easymotion'
" Plug 'rliang/termedit.nvim'
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Plug 'vimwiki/vimwiki'

Plug 'lervag/vimtex'
" Plug 'brennier/quicktex'

" Plug 'rhysd/committia.vim'

Plug 'tmux-plugins/vim-tmux'

call plug#end()

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

set termguicolors

" set background=dark
" colorscheme gotham

" let g:hybrid_custom_term_colors = 1
" set background=dark
" colorscheme hybrid
" let g:airline_theme='hybridline'

" set background=light
" set background=dark
" colorscheme PaperColor
" let g:airline_theme='papercolor'

" set background=dark
" colorscheme OceanicNext
" let g:airline_theme='oceanicnext'

" let g:gruvbox_contrast_dark='hard' " soft, medium, hard
" set background=dark
" colorscheme gruvbox
" let g:airline_theme='gruvbox'

" set background=dark
" colorscheme jellybeans
" let g:airline_theme="jellybeans"

" set background=dark " or light if you prefer the light version
" let g:two_firewatch_italics=1
" colo two-firewatch
"
" let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
let g:airline_theme="ayu"

" colorscheme nova
" let g:airline_theme="nova"

" set background=dark
" let g:nord_comment_brightness = 12
" colorscheme nord
" let g:airline_theme="nord"

" colorscheme minimalist
" let g:airline_theme='minimalist'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" let g:pencil_higher_contrast_ui = 1
" colorscheme pencil
" let g:airline_theme="pencil"


" set background=dark
" colorscheme iceberg
" let g:airline_theme="iceberg"


let g:python_version_2 = 0
let g:python_highlight_all = 1

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

set incsearch
set ignorecase
set smartcase

set noshowmode
set hidden

autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType make setlocal noexpandtab

let mapleader="\<Space>"
tnoremap <Esc> <C-\><C-n>

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

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

nmap <silent> <leader>d <Plug>DashSearch

let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

fun! StripTrailingWhitespaces()
    if &ft =~ 'markdown'
      return
    endif
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
autocmd bufwritepre * :call StripTrailingWhitespaces()

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Append --no-height for neovim terminal
let $FZF_DEFAULT_OPTS .= ' --no-height'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
