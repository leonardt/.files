call plug#begin('~/.local/share/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'chuling/equinusocio-material.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'ryanoasis/vim-devicons'
Plug 'nikvdp/neomux'

Plug 'rhysd/vim-clang-format'
" Plug 'srcery-colors/srcery-vim'
" Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer' }
" Plug 'w0rp/ale'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'donRaphaco/neotex', { 'for': 'tex' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'SirVer/ultisnips'

 Plug 'ncm2/ncm2'
 Plug 'roxma/nvim-yarp'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'lionawurscht/deoplete-biblatex'
" Plug 'Shougo/denite.nvim'

" Plug 'neomake/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Plug 'sheerun/vim-polyglot'
" Plug 'trevordmiller/nova-vim'

Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'

Plug 'ruanyl/vim-gh-line'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'BurntSushi/ripgrep'
Plug 'ihsanturk/neuron.vim'

" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-dispatch'

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'cdonovick/python-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/vim-wasm'
Plug 'vhda/verilog_systemverilog.vim'


" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Plug 'mhinz/vim-startify'

" Plug 'rizzatti/dash.vim'
Plug 'mhinz/neovim-remote'
" Plug 'easymotion/vim-easymotion'
" Plug 'rliang/termedit.nvim'

" Plug 'vimwiki/vimwiki'

Plug 'lervag/vimtex'
" Plug 'brennier/quicktex'

" Plug 'rhysd/committia.vim'

Plug 'tmux-plugins/vim-tmux'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

Plug 'goerz/jupytext.vim'

call plug#end()

call glaive#Install()
" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType gn AutoFormatBuffer gn
"   autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType python AutoFormatBuffer yapf
"   " Alternative: autocmd FileType python AutoFormatBuffer autopep8
" augroup END

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
  autocmd FileType gitcommit set bufhidden=delete
endif

set termguicolors

" set background=dark
" colorscheme gotham
" let g:airline_theme="gotham"

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
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" let g:airline_theme="ayu_mirage"

" colorscheme nova
" let g:airline_theme="nova"

" colorscheme plain
" colorscheme PaperColor
" let g:airline_theme="papercolor"

" set background=dark
" colorscheme nord
" let g:airline_theme="nord"

let g:equinusocio_material_bracket_improved = 1
let g:equinusocio_material_style = 'pure'
colorscheme equinusocio_material
let g:airline_theme = 'equinusocio_material'
set fillchars+=vert:│

" set background=light
" colorscheme PaperColor

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

" colorscheme srcery
" let g:airline_theme="srcery"

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

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType make setlocal noexpandtab

let mapleader="\<Space>"
tnoremap <Esc> <C-\><C-n>
" adapted from https://github.com/tpope/vim-rsi/blob/master/plugin/rsi.vim
tnoremap        <C-A> <C-O>^
tnoremap <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"

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

" nnoremap <c-p> :CocCommand fzf-preview.ProjectFiles<CR>
" nnoremap <leader>b :CocCommand fzf-preview.Buffers<CR>
nnoremap <c-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Dispatch<CR>
nnoremap <leader>C :Dispatch make clean<CR>
nnoremap <leader>a :AbortDispatch<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>

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

" autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
" autocmd bufwritepre * :call StripTrailingWhitespaces()

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
" let $FZF_DEFAULT_OPTS .= ' --no-height'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

autocmd BufNewFIle,BufReadPost *.tex setlocal spell spelllang=en_us

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect


" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" " line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" 
" augroup my_cm_setup
" autocmd!
" autocmd BufEnter * call ncm2#enable_for_buffer()
" autocmd Filetype tex call ncm2#register_source({
"         \ 'name' : 'vimtex-cmds',
"         \ 'priority': 8, 
"         \ 'complete_length': -1,
"         \ 'scope': ['tex'],
"         \ 'matcher': {'name': 'prefix', 'key': 'word'},
"         \ 'word_pattern': '\w+',
"         \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
"         \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"         \ })
" autocmd Filetype tex call ncm2#register_source({
"         \ 'name' : 'vimtex-labels',
"         \ 'priority': 8, 
"         \ 'complete_length': -1,
"         \ 'scope': ['tex'],
"         \ 'matcher': {'name': 'combine',
"         \             'matchers': [
"         \               {'name': 'substr', 'key': 'word'},
"         \               {'name': 'substr', 'key': 'menu'},
"         \             ]},
"         \ 'word_pattern': '\w+',
"         \ 'complete_pattern': g:vimtex#re#ncm2#labels,
"         \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"         \ })
" autocmd Filetype tex call ncm2#register_source({
"         \ 'name' : 'vimtex-files',
"         \ 'priority': 8, 
"         \ 'complete_length': -1,
"         \ 'scope': ['tex'],
"         \ 'matcher': {'name': 'combine',
"         \             'matchers': [
"         \               {'name': 'abbrfuzzy', 'key': 'word'},
"         \               {'name': 'abbrfuzzy', 'key': 'abbr'},
"         \             ]},
"         \ 'word_pattern': '\w+',
"         \ 'complete_pattern': g:vimtex#re#ncm2#files,
"         \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"         \ })
" autocmd Filetype tex call ncm2#register_source({
"         \ 'name' : 'bibtex',
"         \ 'priority': 8, 
"         \ 'complete_length': -1,
"         \ 'scope': ['tex'],
"         \ 'matcher': {'name': 'combine',
"         \             'matchers': [
"         \               {'name': 'prefix', 'key': 'word'},
"         \               {'name': 'abbrfuzzy', 'key': 'abbr'},
"         \               {'name': 'abbrfuzzy', 'key': 'menu'},
"         \             ]},
"         \ 'word_pattern': '\w+',
"         \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
"         \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"         \ })
" augroup END

" Use deoplete.
" let g:deoplete#enable_at_startup = 1
" " Use smartcase.
" call deoplete#custom#option('smart_case', v:true)
" 
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
" 
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction
" 
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete


let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ }
" 
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:polyglot_disabled = ['latex']


" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current line.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Introduce function text object
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <TAB> for selections ranges.
" " NOTE: Requires 'textDocument/selectionRange' support from the language server.
" " coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings using CoCList:
" " Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<c-z>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" nnoremap <leader>lt :<c-u>Denite vimtex<CR>

" call deoplete#custom#var('omni', 'input_patterns', {
"       \ 'tex': g:vimtex#re#deoplete
"       \})
"
let g:ycm_python_interpreter_path = '~/miniconda3/bin/python'

let g:mkdp_auto_close = 0

let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep

autocmd TermOpen * setlocal nonumber

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

let g:tex_flavor = 'latex'
