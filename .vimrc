" --------------------------
" auto install 
" --------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" --------------------------
" Plugins
" --------------------------
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'TovarishFin/vim-solidity'
Plug 'sheerun/vim-polyglot'
call plug#end()

let g:polyglot_disabled = ['solidity']

" --------------------------
" Plugin configs
let g:rustfmt_autosave = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" --------------------------
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" --------------------------
" wvh's .vimrc
" --------------------------
"
" Variable Settings
"
" Don't use vi-compatibility mode
set nocompatible
" set list
set nu
set showmatch
set showmode
"
" Use the smart version of backspace
set backspace=2
"
" Tab-related settings
"set expandtab
"set shiftwidth=4
"set smarttab
set tabstop=4
"
" Enable highlighting of misspelled terms
"set spell
"
" I don't like syntax highlighting
syntax on
"
" Always display row/column info 
set ruler
"
" Don't highlight all search terms, just find them
set nohlsearch
"
" Status line improvements from Kim Schultz ("Hacking Vim")
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
"
" Store backup files in a specific directory
" set backupdir=~/.backups
"
" Create backup files with a tilde extension, as 
" some sites seem to change this
set backupext=~
"
" Force creation of backup files 
set backup
"
" Use UTF-8 as the default text encoding
set encoding=utf-8
"
" Try to set right locale
try
    lang en_US
catch
endtry
"
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
"
" Set characters to show for trailing whitespace and 
" end-of-line. Also supports tab, but I set expandtab 
" and thus tabs are always turned into spaces.
" set listchars=tab:>>,trail:!,eol:$
"
" --------------------------
"
" Specific settings for different types of files
"
" Settings for editing C files
autocmd FileType c setlocal shiftwidth=4 softtabstop=4 expandtab
"
" ------------------------
"
" Key mappings
"
" Invoke ispell for spelling correction
"
map <F2> :w<CR>:!ispell -x %<CR>:e!<CR><CR>
"
" Re-source my vimrc, JIC
map <F4> :source $HOME/.vimrc<CR>
"
" Use F5 to reformat paragraphs
map <F5> !}fmt <CR>
"
" The following emacs-like bindings are
" present because my fingers automatically
" type them, not because I think that 
" they're golden.
"
" Other window (emacs-like)
map <C-X>o <C-W>w
"
" Split screen horiz, prompt for file, and open
" ala gosmacs visit-file or GNU find-file-other-window
"
map <C-X><C-V> :sp 
"
" Buffer list (emacs-like)
map <C-X><C-B> :buffers<CR>
"
" Write current file/buffer ala emacs
map <C-X><C-W> :w<CR>
"
" --------------------------
"
" Functions
"
" Example from developerWorks:
"   http://www.ibm.com/developerworks/linux/library/l-vim-script-1
"
function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction
"
" Toggle syntax setting on/off
map <F4> :execute ToggleSyntax()<CR>
"
" Similar function for when syntax isn't relevant
function! ToggleColor()
   if &t_Co != 0
      set t_Co=0
   else  
      set t_Co=8
   endif
endfunction
"
" Toggle color on/off
map <F6> :execute ToggleColor()<CR>
