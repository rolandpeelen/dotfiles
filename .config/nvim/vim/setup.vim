set backupskip=/tmp/*,/private/tmp/*
set history=250
set ruler
set showcmd
set incsearch
set lz
set autoindent
set smartindent
set expandtab
set tabstop=2
set number
set ignorecase
set smartcase
set numberwidth=4
set colorcolumn=80
set novisualbell
set noerrorbells
set nohidden
set hid
set list
set title
set wrap
set linebreak
set cursorline
set nolazyredraw
set titlestring=VIM:\ %-t\ %y\ %a%r%m titlelen=70

map <silent> <Leader>k :Explore<CR>
map <silent> t<Right> :tabnext<CR>
map <silent> t<Left> :tabprev<CR>
map <silent> tn :tabnew<CR>
map <silent> tc :tabclose<CR>
map <silent> th :tabprev<CR>
map <silent> tl :tabnext<CR>
map <silent> tt :tablast<CR

" Prettier
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2

augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

