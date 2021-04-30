" Setup plugins ------------------------------------------------------------{{{
if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
" All other plugins
" Basics
Plug 'marcweber/vim-addon-mw-utils'
Plug 'chrisbra/unicode.vim' 
Plug 'itspriddle/vim-shellcheck'

" Productivity / UI
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'spf13/vim-autoclose'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/LeaderF'
Plug 'lilydjwg/colorizer'
Plug 'RRethy/vim-illuminate'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ayu-theme/ayu-vim'
Plug 'ayu-theme/ayu-vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" Python
Plug 'psf/black', { 'branch': 'stable' }

" Swift
Plug 'bumaociyuan/vim-swift'

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
autocmd BufReadPost *.rs setlocal filetype=rust
"

let g:LanguageClient_serverCommands = {
\ 'reason': ['~/Git/dotfiles/config/nvim/plugin/reason-language-server'],
\ 'haskell': ['haskell-language-server-wrapper', '--lsp'],
\ 'rust': ['rust-analyzer'],
\ 'python': ['/usr/local/bin/pyls'],
\ }

" Disable this for Rust stuff.
"let g:LanguageClient_rootMarkers = ['main.hs', '*.cabal', 'stack.yaml']

nnoremap <silent> gr :call LanguageClient#explainErrorAtPoint()<cr>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient#textDocument_hover()<cr>



" EditorConfig	----
filetype plugin indent on
" allow backspacing over everything in insert mode
set backspace=indent,eol,start


set backupskip=/tmp/*,/private/tmp/*"
set history=250	    " keep 50 lines of command line history
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
set colorcolumn=80
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
set hidden

" Timeoutlenght
set ttimeoutlen=100

" Orgmode
let g:org_agenda_files = ['~/Documents/Notes/todo.org']
:let g:org_todo_keywords=['TODO', 'DOING', 'REVIEW', '|', 'DONE'] 

" notational velocity
let g:nv_search_paths = ['~/Documents/Notes']
let g:nv_default_extension = '.org'
let g:nv_create_note_key = 'ctrl-x'

" deoplete
let g:python3_host_prog = '/Users/Roland/.pyenv/shims/python'
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({ 
			\ 'enable_ignore_case' : 1 ,
			\ 'enable_smart_case' : 1 ,
			\ 'enable_camel_case' : 1 ,
			\ 'enable_refresh_always' : 1 ,
			\ })
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" netrw settings -----------------------------------------------------------{{{
let g:netrw_banner = 0 
let g:netrw_liststyle = 0
let g:netrw_list_hide='^\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$,\.bs\.js'
let g:netrw_hide = 1
" }}}


"let g:user_emmet_leader_key='<TAB>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Lighline
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'ayu',
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
			\     [ 'mode', 'paste' ],
			\     [ 'filename', 'modified', 'fileencoding', 'fileformat', 'filetype' ]
			\   ],
			\   'right': [
			\     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
			\   ]
			\ },
			\ 'tabline': {
			\   'left': [ [ 'tabs' ] ],
			\   'right': [ [ 'gitbranch' ] ]
			\ },
			\ 'component': {
			\   'charvaluehex': '0x%B',
			\   'percent': '%3p%%',
			\   'lineinfo': "\ue0a1%3l:%-2v",
			\   'paste': '%{&paste?"PASTE":""}',
			\ },
			\ 'component_function': {
			\   'gitbranch': 'LightlineGitBranch',
			\   'filetype': 'MyFiletype',
			\   'fileformat': 'MyFileformat',
			\   'readonly': 'LightlineReadonly'
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
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineGitBranch()
	let branch = fugitive#head()
	if exists('*fugitive#head')
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
nnoremap <silent> <leader>n :NV<CR>
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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
	colorscheme ayu
endif

set lcs+=space:·
set list

" Rainbow parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['[|', '|]'], ['{', '}']]

" LeaderF
"let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap = {'<C-P>': ['<Up>'], '<C-N>': ['<Down>']}


