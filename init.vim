"dein settings
let s:cache_home = expand('~/.config/nvim')
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
let g:python3_host_prog = substitute(system("which python3"), '\n', '', '')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir    = s:cache_home . '/toml'
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"color
syntax enable
colorscheme gruvbox
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

"essential
set list
set ruler
set number
set hidden
set incsearch
set showmatch
set smartcase
set expandtab
set tabstop=2
set nowrapscan
set ignorecase
set autoindent
set matchtime=1
set history=1000
set shiftwidth=2
set pumheight=10
set encoding=utf-8
set completeopt=menu
scriptencoding utf-8
set display=lastline
set shada=!,'100,<0,s10,h,%0
set nrformats=alpha,octal,hex,bin
set fileencodings=utf-8,ios-2022-jp,euc-jp,sjis,cp932
set listchars=tab:»-,trail:·,extends:»,precedes:«,nbsp:%

"assign tmp file
set backupdir=~/.config/nvim/tmp//
set directory=~/.config/nvim/tmp//
set undodir=~/.config/nvim/tmp//
set viewdir=~/.config/nvim/tmp//

"like spacemacs
let mapleader = "\<Space>"
nnoremap <Space> <Nop>
nnoremap <leader>fed :<C-u>e ~/.config/nvim/init.vim<CR>
nnoremap <leader>feR :<C-u>w<CR>:so ~/.config/nvim/init.vim<CR>

"quit
nnoremap <leader>qq :<C-u>qa<CR>
nnoremap <leader>wq :<C-u>wq<CR>
"number
nnoremap <leader>nn :<C-u>set nu!<CR>
nnoremap <leader>nr :<C-u>set rnu!<CR>

"highlight
nnoremap <leader><leader> :<C-u>nohlsearch<CR>

"window
nnoremap <leader>w- <C-w>s
nnoremap <leader>w/ <C-w>v
nnoremap <leader>ww <C-w>w
nnoremap <leader>wW <C-w>W
nnoremap <leader>0  <C-w>t
nnoremap <leader>1  <C-w>t<C-w>w
nnoremap <leader>2  <C-w>t<C-w>w<C-w>w
nnoremap <leader>3  <C-w>t<C-w>w<C-w>w<C-w>w
nnoremap <leader>4  <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w
nnoremap <leader>5  <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w
nnoremap <leader>w= <C-w>=
nnoremap <leader>w< <C-w><
nnoremap <leader>w> <C-w>>
nnoremap <leader>wd <C-w>c

"buffer
nnoremap <leader>b :<C-u>b 
nnoremap <leader>bp :<C-u>bp<CR>
nnoremap <leader>bn :<C-u>bn<CR>
nnoremap <leader>bd :<C-u>bd<CR>

"replace
nnoremap <leader>s :<C-u>%s///g<Left><Left><Left>
vnoremap <leader>s :s///g<Left><Left><Left>

"cursor
noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap H ^
noremap L $
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <C-b>
cnoremap <C-u> <C-e><C-u>

"other
nnoremap Y y$
nnoremap > >>
nnoremap < <<
nnoremap x "_x
nnoremap s "_s
inoremap <C-]> <ESC><Right>

"fileType
augroup fileType
  autocmd!
  autocmd BufNewFile,BufRead *.ws setlocal noautoindent noexpandtab tabstop=1 listchars=tab:–~,trail:·,eol:¬,extends:»,precedes:«,nbsp:%
augroup END

