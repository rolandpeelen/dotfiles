:TagbarOpen
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal fileformat=unix
setlocal encoding=utf-8
let python_highlight_all=1

" vim-test
let g:test#python#runner = 'pytest'
let g:test#python#pyunit#options = {
\   'file': '-v',
\   'suite': '-v'
\ }

" ale
let b:ale_linters = {
\   'python': ['flake8'],
\ }
let b:ale_fixers = {
\   'python': ['autopep8'],
\ }
let b:ale_warn_about_trailing_whitespace = 0
