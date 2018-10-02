if v:progname =~? "evim"
    finish
endif

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

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off    " Required for vundle

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
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'vim-scripts/Syntastic'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tlib_vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'bling/vim-airline'
Plugin 'townk/vim-autoclose'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'junegunn/vim-github-dashboard'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'rodjek/vim-puppet'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'kylef/apiblueprint.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'kaicataldo/material.vim'
Plugin 'leafgarland/typescript-vim'
" Material Theme Configuration 
let g:material_theme_style = 'dark'
" All of your Plugins must be added before the following line
call vundle#end()            " required

if installVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

filetype plugin indent on    " required

" Set default indentation
set ts=2 sw=2 sts=2 expandtab

if has("autocmd")
    filetype on
    autocmd BufNewFile,BufRead *.eyaml set ft=yaml
    autocmd BufNewFile,BufRead *.dump set ft=mysql
    autocmd BufNewFile,BufRead *.sql set ft=mysql
    autocmd BufNewFile,BufRead *.rss,*.atom set ft=xml

    " Set filetype specific indentation
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType javascript setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType scss setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType css setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType ruby setlocal ts=2 sw=2 sts=2 expandtab

    " remove trailing whitespace on save
    autocmd BufWritePre *.go,*.js,*.html call <SID>Preserve("%s/\\s\\+$//e")

    " reload .vimrc on write when editing it
    autocmd BufWritePost .vimrc source $MYVIMRC
endif

" Retab so file isn't mixed tabbing
retab!

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backupskip=/tmp/*,/private/tmp/*"
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
set lz          " Lazy redraw
set autoindent      " Automatic indenting, on new line
set smartindent     " Smart indenting, based on the typed code.
set smarttab        " Use tabs at the start of a line, spaces elsewhere.
set number      " Line nubmering
set ignorecase
set smartcase
set numberwidth=4
set novisualbell
set noerrorbells
set nohidden        " remove the buffer when closing a tab
set hid
set listchars=tab:▸\ ,eol:¬
set list
set title
set titlestring=VIM:\ %-t\ %y\ %a%r%m titlelen=70
set wrap
set linebreak
set cursorline

" Airline settings
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_modified=1
let g:airline#extensions#whitespace#enabled=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1

" Wildmenu/Wildmode for easily see which command line options are available
set wildmenu
set wildmode=longest:full,full

" Folding
set nofoldenable
"set foldmethod=syntax
"set foldlevelstart=1
"set foldminlines=2
"set foldlevel=100
"set foldopen-=search
"set foldopen-=undo
"set foldcolumn=3
"let php_folding=1
"let javaScript_fold=1
"let ruby_fold=1
"let sh_fold_enable=1

" Mappings
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
nmap ,v :vsplit $MYVIMRC<CR>

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


" Material Theme Configuration 
let g:material_theme_style = 'dark'
if (has("termguicolors"))
  set termguicolors
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    "colorscheme alduin
    "colorscheme jellybeans
    colorscheme material
    set background=dark
    syntax on
    set hlsearch
endif


" Syntastic stuff
" tidy html5, instead of 2006 version
let g:syntastic_html_tidy_exec = 'tidy5'

" js checkers
let g:syntastic_javascript_checkers = ['eslint']
" ignore ionic tags and angular attributes
let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]

" syntax for js libs
let g:used_javascript_libs = 'underscore,lodash,angularjs,angularuirouter'

" Rainbow parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
