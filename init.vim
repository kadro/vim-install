" ====================================================
"                       VUNDLE
" ====================================================
set nocompatible               " be improved, required
filetype off                   " required
" Set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')            " required
Plugin 'VundleVim/Vundle.vim'  " required

" ====================================================
"                       PLUGINS
" ====================================================

" ctrlp.vim is used for opening files with wildcard search
" https://github.com/ctrlpvim/ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_custom_ignore = '\.git\|node_modules' " Remove some folders from search
  let g:ctrlp_show_hidden = 1                       " Display hidden files

" vim-airline adds an improved status bar at the bottom
" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'

" vim-gitgutter shows a git diff in the left column
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" nerdtree is a directory browsing side bar to find files
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
  " Toggle the nerd tree
  nnoremap <leader>c :NERDTreeToggle<CR>

  " Finds the open file in the nerd tree
  nnoremap <leader>r :NERDTreeFind<CR>

" vim-bad-whitespace highlights whitespace at the end of lines
" https://github.com/bitc/vim-bad-whitespace
Plugin 'bitc/vim-bad-whitespace'

" ale is a asynchronous linting and language server protocol client
" https://github.com/w0rp/ale
Plugin 'w0rp/ale'
  let g:ale_sign_column_always = 1      " Keep the error column gutter always open
  let g:ale_linters = {
    \'go': ['go build', 'golint', 'go vet'],
    \'typescript': [],
    \'javascript': ['eslint', 'prettier', 'jshint', 'standard', 'xo', 'prettier-eslint']
  \}                                    " Linter configurations for each language
  let g:ale_sign_error = '⤫'
  let g:ale_sign_warning = '⚠'

" indentLine highlights indentation
" https://github.com/Yggdroot/indentLine
Plugin 'Yggdroot/indentLine'
  let g:indentLine_char = '┆'

" vim-session is a extended session management for Vim
" https://github.com/xolox/vim-session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
  let g:session_directory = '~/.config/nvim/sessions/'

call vundle#end()               " required
filetype plugin indent on       " required

" ====================================================
"                    GLOBAL CONFIG
" ====================================================

set updatetime=100      " Change delay for updates like gitgutter, lint etc
set clipboard=unnamed   " Enable clipboard integration
set mouse=a             " Makes selecting/copying work with only the file text
set wrap lbr            " Will wrap long lines between words
set ic                  " Defaults vim to ignore case

" Rulers
set colorcolumn=80,120  " Change the backgroud color of the 80 column

" Tabs and Panes
set tabpagemax=20       " Maximum number of tabs to be open in bulk
set splitbelow          " Horizontal splits will open below
set splitright          " Vertical splits will open to the right

" Loading nvimrc per project
set exrc                " Allows EXecuting local RCs.
set secure              " Disallows autocmd shell and write commands in local .vimrc

" Tabs vs Spaces
set expandtab           " Sets tabs to spaces
set tabstop=2           " Sets tab size
set shiftwidth=2        " Sets indent size

" Files vs External
au CursorHold * checktime   " Checks for external changes in open file
set autoread                " Auto reloads a file if external changes happen and it's not modified in buffer

" Line numbers
set number              " Displays line numbers
set relativenumber      " Makes line number relative to current line

" Folding
set foldmethod=indent   " Folding will happen based on indentation
set foldnestmax=10      " Only up to 10 levels deep
set nofoldenable        " Starts with all unfolded

" Cursor
set cursorline          " Enables a line highlight at the cursor
set cursorcolumn        " Enables a column highlight at the cursor

" Colors
colorscheme molokai

" ====================================================
"                KEYBOARD SHORTCUTS
" ====================================================

" Removes highlighting
nnoremap <F3> :noh<CR>

" Toggles on/off ignorecase
nnoremap <F4> :set ignorecase!<CR>

" Source vimrc/init.vim file
nnoremap <leader>vv :source ~/.config/nvim/init.vim<CR>

" Search and replace word under cursor
nnoremap <leader>d :%s/\<<C-r><C-w>\>/

" Navigate between vim panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Navigate between vim tabs
nnoremap H gT
nnoremap L gt
