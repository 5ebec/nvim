call defx#custom#column('filename',{'indent': " "})
call defx#custom#column('mark', {
            \ 'readonly_icon': '✗',
            \ 'root_icon': ' ',
            \ 'selected_icon': '✓',
            \ })
nnoremap <silent> <Space>ff :Defx -new -auto-cd -columns=mark:filename:size -show-ignored-files `expand('%:p:h')` -search=`expand('%:p')` -split="vertical" -winwidth=35 <CR>:IndentLinesDisable<CR>

autocmd FileType defx call s:defx_my_settings()
function!  s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>          defx#is_directory()?defx#do_action('open_or_close_tree'):defx#do_action('drop')
    nnoremap <silent><buffer><expr> l             defx#is_directory()?defx#do_action('open_directory'):defx#do_action('drop')
    nnoremap <silent><buffer><expr> a             defx#do_action('new_file')
    nnoremap <silent><buffer><expr> A             defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> h             defx#do_action('cd',['..'])
    nnoremap <silent><buffer><expr> dd            defx#do_action('remove',['..'])
    nnoremap <silent><buffer><expr> r             defx#do_action('rename',['..'])
    nnoremap <silent><buffer><expr> ~             defx#do_action('cd')
    nnoremap <silent><buffer><expr> v             defx#do_action('toggle_select').'j'
    nnoremap <silent><buffer><expr> .             defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> R             defx#do_action('redraw')
    nnoremap <silent><buffer><expr> yy            defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> !             defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x             defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> c             defx#do_action('copy')
    nnoremap <silent><buffer><expr> p             defx#do_action('paste')
endfunction
