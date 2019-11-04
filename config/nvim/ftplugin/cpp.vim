setlocal tabstop=4 
setlocal softtabstop=4 
setlocal shiftwidth=4 
setlocal noexpandtab
setlocal colorcolumn=80

" ale
let b:ale_linters = {
\   'cpp': ['gcc'],
\ }
let b:ale_fixers = {
\   'cpp': ['clang-format']
\}


au BufWritePre *.cc call <SID>Preserve("%s/\\s\\+$//e")
au BufWritePre *.cpp call <SID>Preserve("%s/\\s\\+$//e")

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
