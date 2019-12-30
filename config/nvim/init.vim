" Setup plugins ------------------------------------------------------------{{{
if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
" All other plugins
" Basics
Plug 'tomtom/tlib_vim'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'chrisbra/unicode.vim' 

" Productivity / UI
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'townk/vim-autoclose'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'kaicataldo/material.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/LeaderF'
Plug 'lilydjwg/colorizer'
Plug 'RRethy/vim-illuminate'


" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'


" Javascript
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'othree/jspc.vim'
Plug 'elzr/vim-json'
Plug 'carlitux/deoplete-ternjs'
Plug 'Galooshi/vim-import-js'
Plug 'williamboman/vim-import-ts'
Plug 'prettier/vim-prettier'

" Reason (as per vim-reason-plus recommendations)
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

call plug#end()
" }}}


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
let g:python3_host_prog = '/usr/local/bin/python3'
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
let g:netrw_liststyle = 4
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$,*\.bs.js'
" }}}

" ale
let g:ale_completion_enabled = 1
let g:ale_pattern_options_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"let g:user_emmet_leader_key='<TAB>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Lighline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'material_vim',
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

" Wildmenu/Wildmode for easily see which command line options are available
set wildmenu
set wildmode=longest:full,full

" Mappings
nmap <leader>k :Explore<CR>
nmap <leader>v :Vexplore<CR>
nmap <leader>vn :vnew<CR>
nmap <leader>l :set list!<CR>
nmap <silent> _$ :call <SID>Preserve("%s/\\s\\+$//e")<CR>
nmap <silent> _= :call <SID>Preserve("normal gg=G")<CR>
nmap <silent> _0 :call <SID>Preserve(":g/^\s*$/d")<CR>
inoremap jj <Esc>
nnoremap gb :ls<CR>:b<Space>
nmap ,v :vsplit $MYVIMRC<CR>
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" remap for when deoplete is in view
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

map <silent> <c-h> <Plug>WinMoveLeft
map <silent> <c-j> <Plug>WinMoveDown
map <silent> <c-k> <Plug>WinMoveUp
map <silent> <c-l> <Plug>WinMoveRight

" Tabs
let g:TabLineSet_verbose = 'tabnr,bufnr'
map <silent> t<Right> :tabnext<CR>
map <silent> t<Left> :tabprev<CR>
map <silent> tn :tabnew<CR>
map <silent> tc :tabclose<CR>
map <silent> th :tabprev<CR>
map <silent> tl :tabnext<CR>
map <silent> tt :tablast<CR>

set switchbuf=usetab
set stal=2

" Hide some files
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$,*\.bs.js'

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

" Material Theme Configuration 
let g:material_theme_style = 'palenight'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    set background=dark
    colorscheme material
    syntax on
    set hlsearch
endif

" ignore ionic tags and angular attributes
let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]

" Rainbow parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" LeaderF
"let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap = {'<C-P>': ['<Up>'], '<C-N>': ['<Down>']}


