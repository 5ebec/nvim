let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

function! s:my_cr_function() abort
  return deoplete#close_popup() . lexima#expand('<CR>','i')
endfunction

let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#max_list = 100

"" limit only to deoplete-zsh when in deol buffer
"call deoplete#custom#option('sources', {  'zsh': ['zsh'], })
