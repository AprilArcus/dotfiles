function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'GutenYe/json5.vim'
"Plug 'Kriegslustig/vim-flow'
Plug 'jacoborus/tender'
Plug 'sjl/vitality.vim', Cond(!has('nvim'))
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'brettanomyces/nvim-terminus', Cond(has('nvim'))
Plug 'neomake/neomake'
Plug 'jaawerth/neomake-local-eslint-first'
Plug 'rust-lang/rust.vim'
call plug#end()

" System integration
set clipboard^=unnamed
if has('unnamedplus')
  set clipboard^=unnamedplus
endif

" Filetypes
filetype on
autocmd BufRead,BufNewFile */.babelrc setfiletype json5
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
autocmd FileType javascript,json,json5
  \ setlocal expandtab shiftwidth=2 softtabstop=2

" Color Scheme
syntax enable
if (has("termguicolors"))
 set termguicolors
endif
colorscheme tender
hi! link VertSplit TabLine
hi Comment term=italic cterm=italic gui=italic
let g:terminal_color_8 = "#666666"
let g:terminal_color_15 = "#eeeeee"

" Status Line
set noshowmode
set laststatus=2
set showtabline=2
let g:lightline = {
\ 'colorscheme': 'tender',
\ 'component': {
\   'readonly': '%{&readonly?"":""}',
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' }
\ }

" Splits
set splitright
set splitbelow

" Misc Appearance
set cursorline
let &colorcolumn="73,75,77,79,".join(range(81,999),",")
set number
set list
set listchars=eol:¬,tab:╶─,trail:⋅,nbsp:_,extends:>,precedes:<
if has('patch-7.4-710')
  set listchars+=space:⋅
endif
set fillchars+=vert:\ 
set fillchars+=diff:\ 

" Linting
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_error_sign = {
\ 'text': '●',
\ 'texthl': 'NeomakeErrorSign'
\ }
let g:neomake_warning_sign = {
\ 'text': '●',
\ 'texthl': 'NeomakeWarningSign'
\ }
let g:neomake_message_sign = {
\ 'text': '►',
\ 'texthl': 'NeomakeMessageSign'
\ }
let g:neomake_info_sign = {
\ 'text': 'i',
\ 'texthl': 'NeomakeInfoSign'
\ }
hi! link SignColumn LineNr
augroup dummysign
    au BufWinEnter * sign define dummy
    au BufWinEnter * exe "sign place 9999 line=1 name=dummy buffer=" . bufnr('%')
augroup END
hi! link NeomakeErrorSign GitGutterDelete
hi! link NeomakeWarningSign NERDTreeClosable
hi! link NeomakeMessageSign GitGutterAdd
hi! link NeomakeInfoSign GitGutterChange
autocmd! BufWritePost,BufEnter * Neomake

set lazyredraw
set mouse=a
if !has('nvim')
  set ttyfast
  if has('mouse_sgr')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  end
endif

set timeoutlen=1000 ttimeoutlen=0

:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  :tnoremap <Esc> <C-\><C-n>
  :tnoremap <C-h> <C-\><C-n><C-w>h
  :tnoremap <C-j> <C-\><C-n><C-w>j
  :tnoremap <C-k> <C-\><C-n><C-w>k
  :tnoremap <C-l> <C-\><C-n><C-w>l
endif

"let g:terminus_default_mappings = 1
"let g:terminus_default_prompt = '%'
"let g:terminus_use_xterm_title = 1
