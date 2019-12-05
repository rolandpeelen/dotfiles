set conceallevel=1
setlocal conceallevel=1
setlocal foldmethod=syntax
setlocal tabstop=2 
setlocal shiftwidth=2 
setlocal expandtab

" Reason Language Server
let g:LanguageClient_serverCommands = {
\ 'reason': ['~/.config/nvim/plugin/reason-language-server'],
\ }

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient#textDocument_hover()<cr>

" TODO -- Make this work
"au BufWritePre *.re call <SID>Preserve(LanguageClient#textDocument_formatting())

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
