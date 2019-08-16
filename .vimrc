" Vundle --------
filetype off	" Required for vundle

" Install Vundle if not installed
let installVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
    let installVundle=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"let g:vundle_default_git_proto = 'git'
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" All other plugins
" Basics
Plugin 'tomtom/tlib_vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'junegunn/gv.vim'
Plugin 'chrisbra/unicode.vim' 

" Productivity / UI
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'townk/vim-autoclose'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'hzchirs/vim-material'
Plugin 'metakirby5/codi.vim'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'
Plugin 'ryanoasis/vim-devicons'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-github-dashboard'
Plugin 'airblade/vim-gitgutter'


" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'
Plugin 'othree/jspc.vim'
Plugin 'elzr/vim-json'
Plugin 'posva/vim-vue'
Plugin 'carlitux/deoplete-ternjs'

" All of your Plugins must be added before the following line
call vundle#end()	     " required

if installVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif
" Vundle --------

:python3 import neovim
" Functions -----
function! <SID>Preserve(command)
    " Save last search, and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")

    " run command
    execute a:command

    " restore state
    let @/=_s
    call cursor(l, c)
endfunction

" Highlight a column in csv text
" :Csv 1    " Highlight first column
" :Csv 0    " switch off hilight
function! CSVH(colnr)
    if a:colnr > 1
	let n = a:colnr - 1
	execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
	execute 'normal! 0'.n.'f,'
    elseif a:colnr == 1
	match Keyword /^[^,]*/
	normal! 0
    else
	match
    endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)
" Functions -----

" EditorConfig	----
filetype plugin indent on
" allow backspacing over everything in insert mode
set backspace=indent,eol,start


set backupskip=/tmp/*,/private/tmp/*"
set history=50	    " keep 50 lines of command line history
set ruler	" show the cursor position all the time
set showcmd	" display incomplete commands
set incsearch	    " do incremental searching
set lz		" Lazy redraw
set autoindent	    " Automatic indenting, on new line
set smartindent     " Smart indenting, based on the typed code.
set smarttab	    " Use tabs at the start of a line, spaces elsewhere.
set number  " Line nubmering
set ignorecase
set smartcase
set numberwidth=4
set novisualbell
set noerrorbells
set nohidden	    " remove the buffer when closing a tab
set hid
set listchars=tab:▸\ ,eol:¬
set list
set relativenumber
set title
set titlestring=VIM:\ %-t\ %y\ %a%r%m titlelen=70
set wrap
set linebreak
set cursorline
set nofoldenable
" EditorConfig	----
"
" Autocommands ----
" Set default indentation
if has("autocmd")
    augroup init
      au!
      au BufRead * RainbowParentheses
    augroup END

    " remove trailing whitespace on save
    autocmd BufWritePre *.go,*.js,*.ts,*.html call <SID>Preserve("%s/\\s\\+$//e")

    " reload .vimrc on write when editing it
    autocmd BufWritePost .vimrc source $MYVIMRC
endif
" Autocommands ----

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#min_pattern_length = 2
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#sources = {}
let g:deoplete#omni#functions = {}
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" netrw settings -----------------------------------------------------------{{{
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'
" }}}

" ale
let g:ale_completion_enabled = 1
let g:ale_pattern_options_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

""let g:user_emmet_leader_key='<TAB>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Lighline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'separator': {
      \   'left': "\ue0b8",
      \   'right': "\ue0be"
      \ },
      \ 'subseparator': {
      \   'left': "\ue0b9",
      \   'right': "\ue0b9"
      \ },
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'filename', 'modified', 'fileencoding', 'fileformat', 'filetype' ]
      \   ],
      \   'right': [
      \     [ 'readonly', 'charvaluehex', 'percent', 'lineinfo' ],
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \     [ 'filename', 'modified', 'fileencoding', 'fileformat', 'filetype' ]
      \   ],
      \   'right': [
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
      \   ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'vimlogo', 'tabs' ] ],
      \   'right': [ [ 'gitbranch', 'close' ] ]
      \ },
      \ 'tabline_separator': {
      \   'left': "\ue0bc",
      \   'right': "\ue0ba"
      \ },
      \ 'tabline_subseparator': {
      \   'left': "\ue0bb",
      \   'right': "\ue0bb"
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \   'percent': '%3p%%',
      \   'lineinfo': "\ue0a1%3l:%-2v",
      \   'paste': '%{&paste?"PASTE":""}',
      \   'vimlogo': "\ue7c5"
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitBranch',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'readonly': 'LightlineReadonly'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'middle',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'middle',
      \ },
      \ 'component_visible_condition': {
      \   'modified': '&modified||!&modifiable',
      \   'readonly': '&readonly',
      \   'paste': '&paste',
      \ }
      \ }
let g:lightline#ale#indicator_checking = "\ue0b8"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineGitBranch()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

" tagbar
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autoshowtag = 1

" Retab so file isn't mixed tabbing
retab!

" Airline settings
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_modified=1
let g:airline#extensions#whitespace#enabled=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline_theme = 'material'

" Wildmenu/Wildmode for easily see which command line options are available
set wildmenu
set wildmode=longest:full,full

" Mappings
nmap <leader>i :call <SID>Preserve(":!refmt --in-place %")<CR>L<CR>
nmap <leader>k :Explore<CR>
nmap <leader>t :TagbarToggle<CR>
nmap <leader>v :Vexplore<CR>
nmap <leader>vn :vnew<CR>
nmap <leader>l :set list!<CR>
nmap <silent> _$ :call <SID>Preserve("%s/\\s\\+$//e")<CR>
nmap <silent> _= :call <SID>Preserve("normal gg=G")<CR>
nmap <silent> _0 :call <SID>Preserve(":g/^\s*$/d")<CR>
inoremap jj <Esc>
nnoremap gb :ls<CR>:b<Space>
nmap <leader>codi :Codi!!<CR>
nmap ,v :vsplit $MYVIMRC<CR>
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" allow hjkl for moving between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w>h <C-w><Left>
map <C-w>j <C-w><Down>
map <C-w>k <C-w><Up>
map <C-w>l <C-w><Right>

" Tabs
let g:TabLineSet_verbose = 'tabnr,bufnr'
map <silent> t<Right> :tabnext<CR>
map <silent> t<Left> :tabprev<CR>
map <silent> tn :tabnew<CR>
map <silent> tc :tabclose<CR>
map <silent> th :tabprev<CR>
map <silent> tl :tabnext<CR>
map <silent> tt :tablast<CR>

" use cmd key to scroll over softwraps
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g4
vmap <D-6> g6
vmap <D-0> g0
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g4
nmap <D-6> g6
nmap <D-0> g0

set switchbuf=usetab
set stal=2

map t1 1gt
map t2 2gt
map t3 3gt
map t4 4gt
map t5 5gt
map t6 6gt
map t7 7gt
map t8 8gt
map t9 9gt
map t0 10gt

" Don't use Ex mode, use Q for formatting
map Q gq

" Map for man pages
map man <ESC>:!man

" Hide some files
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

if (has("termguicolors"))
  set termguicolors
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    "colorscheme alduin
    "colorscheme jellybeans
    colorscheme material
    "colorscheme onehalfdark
    set background=dark
    syntax on
    set hlsearch
endif

" Material Theme Configuration 
let g:material_theme_style = 'default'

" ignore ionic tags and angular attributes
let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]

" Rainbow parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

