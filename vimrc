"""""" PATHOGEN """""""
" Q: Can I put pathogen.vim in a submodule like all my other plugins?
" A: Sure, stick it under ~/.vim/bundle, and prepend the following to your vimrc:
runtime bundle/vim-pathogen/autoload/pathogen.vim
" -- https://github.com/tpope/vim-pathogen#faq

execute pathogen#infect()
" -- https://github.com/tpope/vim-pathogen#runtime-path-manipulation
"""""""""""""""""""""""

"""" COLOR SCHEME """""
syntax enable
colorscheme solarized
" -- https://github.com/altercation/vim-colors-solarized#modify-vimrc

" transparent background for changing amongst base16 color schemes:
highlight Normal ctermbg=none
highlight NonText ctermbg=none
" -- http://stackoverflow.com/questions/21572179/vim-color-scheme-overriding-the-background-settings-in-gnome-terminal#comment32584844_21572296
""""""""""""""""""""""""

""""" FAST REDRAWS """""
set lazyredraw
set ttyfast
" -- https://www.atomaka.com/blog/slow-redraws-in-vim-terminal-edition/
""""""""""""""""""""""""

"""" MOUSE SUPPORT """""
set mouse=a
set ttymouse=xterm2
" -- http://usevim.com/2012/05/16/mouse/
""""""""""""""""""""""""

""" FAST NORMAL MODE """
" Disable or reduce delay after sending "escape" code
" It might be more reasonable to give ttimeoutlen a more reasonable
" value, like 10ms, although I have encountered no issues yet.
set timeoutlen=1000 ttimeoutlen=0
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
""""""""""""""""""""""""