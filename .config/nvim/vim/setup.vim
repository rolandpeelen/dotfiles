filetype plugin on

set backupskip=/tmp/*,/private/tmp/*
set history=500
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
set colorcolumn=110
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
set relativenumber

" Start oil on leader-k - this used to be :Explore
map <silent> <Leader>k :Oil<CR>

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

" Map :cnext and :cprev to leader shortcuts
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>

augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

" True Colours
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" For Latex PDF Viewing
let g:vimtex_view_method = 'sioyek'
let g:vimtex_callback_progpath ='/usr/local/bin/nvim'
