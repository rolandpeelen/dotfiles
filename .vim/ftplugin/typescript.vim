let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "\uf810"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "\ufc64"
let g:javascript_conceal_underscore_arrow_function = "\uf876"

set conceallevel=1
setlocal conceallevel=1
setlocal foldmethod=syntax
setlocal tabstop=2 
setlocal shiftwidth=2 
setlocal expandtab


" deoplete
set completeopt=menuone,preview
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filter = 0
"let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#filetypes = [
\   'javascript',
\   'jsx',
\   'javascript.jsx',
\   'vue',
\   'typescript',
\]

" jsdoc
nmap <silent> <leader>jsd <Plug>(jsdoc)
let b:javascript_plugin_jsdoc = 1
let b:jsdoc_allow_input_prompt = 1
let b:jsdoc_input_description = 1
let b:jsdoc_return = 1
let b:jsdoc_return_type = 1
let b:jsdoc_return_description = 1
let b:jsdoc_underscore_private = 1
let b:jsdoc_enable_es6 = 1

" ale
let b:ale_javascript_prettier_use_local_config = 1
let b:ale_linters = {
\   'typescript': ['tslint'],
\ }
let b:ale_fixers = {
\   'typescript': ['prettier', 'tslint', 'importts'],
\ }
let g:ale_pattern_options = {
\  '\.min\.js$': {'ale_enabled': 0},
\  '\.min\.css$': {'ale_enabled': 0},
\}

" vim-test
let g:test#javascript#jest#options = '--verbose --detectOpenHandles'

au BufWritePre *.js call <SID>Preserve("%s/\\s\\+$//e")

au FileType javascript,json,jsx,typescript,tsx call ImproveNodeEditing()

function! ImproveNodeEditing()
  setlocal isfname+=@-@ " some node_modules are namespaced with an @
  setlocal suffixesadd+=.js,.json,.jsx,.ts,.tsx
  setlocal includeexpr=LookupNodeModule(v:fname)
endfunction

function! LookupNodeModule(fname)
  let basePath = finddir('node_modules', expand('%:p:h') . ';' . getcwd()) . '/' . a:fname
  let indexFileJs = basePath . '/index.js'
  let indexFileTs = basePath . '/index.ts'
  let packageFile = basePath . '/package.json'

  if filereadable(packageFile)
    let package = json_decode(join(readfile(packageFile)))

    if has_key(package, 'module')
      return basePath . '/' . package.module
    endif

    if has_key(package, 'main')
      return basePath . '/' . package.main
    endif
  endif

  if filereadable(indexFileTs)
    return indexFileTs
  endif

  if filereadable(indexFileJs)
    return indexFileJs
  endif

  return basePath
endfunction

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
