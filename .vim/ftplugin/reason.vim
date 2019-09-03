set conceallevel=1
setlocal conceallevel=1
setlocal foldmethod=syntax
setlocal tabstop=2 
setlocal shiftwidth=2 
setlocal expandtab

au BufWritePre *.js call <SID>Preserve("%s/\\s\\+$//e")


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
