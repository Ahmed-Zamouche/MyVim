let s:scriptPath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function MyPlugInit()
  echo "MyPlugInit"
  " Specify a directory for plugins
  " - For Neovim: stdpath('data') . '/plugged'
  " - Avoid using standard Vim directory names like 'plugin'
  call plug#begin('~/.vim/plugged')

  Plug 'kevinoid/vim-jsonc'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'itchyny/lightline.vim'

  Plug 'junegunn/fzf', {'do':{->fzf#install()}}
  Plug 'junegunn/fzf.vim'

  if exists("*MyProjectPlugInit")
    call MyProjectPlugInit()
  endif

  " Initialize plugin system
  call plug#end()
endfunction

function MyOptionsInit()
  echo "MyOptionsInit"

  set path=.,/usr/include,,
  set path+=./**
  "set tabstop=2 shiftwidth=2 expandtab

  source ~/.MyVim/fzf/init.vim

  colorscheme  gruvbox

 syntax enable                   " Enables syntax highlight
  set number                      " Shows line numbers
  set ruler                       " Shows the rulers
  set showcmd                     " Shows current cursor info
  set autoindent                  " Automatically guesses the indentation given the previous one
  set shiftwidth=2                " Uses 2 space tabs by default
  set softtabstop=2
  set expandtab                   " Convert tabs into spaces
  set hlsearch                    " Automatically highlights search results, to hide them run :noh
  set incsearch                   " Searches incremetally as you type.
  set ignorecase                  " Ignores cases when searching
  set noswapfile                  " Disables swap files
  set undofile                    " Enable keeping history across sessions, don't forget to mkdir
  set undodir=~/.vim/undo/
  set nofixeol                    " Do not insert a new line at the end of the file automatically
  set backspace=indent,eol,start  " Enable backspace key to delete stuffs properly
  "set spell spelllang=en_uk
  if exists("*MyProjectOptionsInit")
    call MyProjectOptionsInit()
  endif
  " Script trailing whitespaces
  autocmd BufWritePre * :%s/\s\+$//e
endfunction

function MyMapsInit()

  echo "MyMapsInit"
  noremap qq :q<cr>

  " let mapleader = "'"
  " edit / source .vimrc
  noremap <leader>ev :vsplit .vimrc<cr>
  noremap <leader>sv :source .vimrc<cr>
  noremap <leader>egv :vsplit ~/.MyVim/init.vim<cr>
  noremap <leader>sgv :source ~/.MyVim/init.vim<cr>

  " Map Alt+(j|k) to move (a) line(s)
  nnoremap <A-j> :m .+1<cr>==
  nnoremap <A-k> :m .-2<cr>==
  inoremap <A-j> <esc>:m .+1<cr>==gi
  inoremap <A-k> <esc>:m .-2<cr>==gi
  vnoremap <A-j> :m '>+1<cr>gv=gv
  vnoremap <A-k> :m '<-2<cr>gv=gv

  nnoremap <A-down> :m .+1<cr>==
  nnoremap <A-up> :m .-2<cr>==
  inoremap <A-down> <esc>:m .+1<cr>==gi
  inoremap <A-up> <esc>:m .-2<cr>==gi
  vnoremap <A-down> :m '>+1<cr>gv=gv
  vnoremap <A-up> :m '<-2<cr>gv=gv

  " Map windows navigation ctrl+{h,j,k,l}
  nnoremap <C-up> <C-w>k
  nnoremap <C-down> <C-w>j
  nnoremap <C-left> <C-w>h
  nnoremap <C-right> <C-w>l

  inoremap <C-up> <esc><C-w>k
  inoremap <C-down> <esc><C-w>j
  inoremap <C-left> <esc><C-w>h
  inoremap <C-right> <esc><C-w>l

  tnoremap <C-up> <C-\><C-N><C-w>k
  tnoremap <C-down> <C-\><C-N><C-w>j
  tnoremap <C-left> <C-\><C-N><C-w>h
  tnoremap <C-right> <C-\><C-N><C-w>l

  nnoremap <C-k> <C-w>k
  nnoremap <C-j> <C-w>j
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l

  inoremap <C-k> <esc><C-w>k
  inoremap <C-j> <esc><C-w>j
  inoremap <C-h> <esc><C-w>h
  inoremap <C-l> <esc><C-w>l

  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-l> <C-\><C-N><C-w>l

  " Map tabs navigation Alt+{h,l}
  nnoremap <A-left> :tabprevious<cr>
  nnoremap <A-h> :tabprevious<cr>
  nnoremap <A-right> :tabnext<cr>
  nnoremap <A-l> :tabnext<cr>
  inoremap <A-right> <esc>:tabnext<cr>
  inoremap <A-left> <esc>:tabprevious<cr>
  inoremap <A-h> <esc>:tabprevious<cr>
  inoremap <A-l> <esc>:tabnext<cr>

  " Map buffer navigation Alt+{h,j,k,l}
  nnoremap <C-S-left> :bprevious<cr>
  nnoremap <C-S-h> :bprevious<cr>
  nnoremap <C-S-right> :bnext<cr>
  nnoremap <C-S-l> :bnext<cr>
  inoremap <C-S-right> <esc>:bnext<cr>
  inoremap <C-S-left> <esc>:bprevious<cr>
  inoremap <C-S-h> <esc>:bprevious<cr>
  inoremap <C-S-l> <esc>:bnext<cr>

  inoremap jk <esc>
  " inoremap <esc> <nop>

  nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
  nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
  nnoremap <C-S-h> 0
  nnoremap <C-S-l> $

  noremap <F3> :NERDTreeToggle<cr>
  " Map terminal
  tnoremap <Esc> <C-\><C-n>

  iabbrev myname Ahmed Zamouche
  iabbrev myemail ahmed.zamouche@gmail.com
  iabbrev myphone +46(0)730 97 43 17
  iabbrev mysig --<cr>Ahmed Zamouche<cr>ahmed.zamouche@gmail.com

 if exists("*MyProjecMapsInit")
    call MyProjectMapsInit()
  endif

endfunction

function MyCocInstall()
  echo "MyCocInstall"
  :CocInstall coc-sh
  :CocInstall coc-json
  :CocInstall coc-clangd
endfunction

function MyHookInit()
  echo "MyHookInit"
  let s:file = getcwd() . '/.vimrc'
  if filereadable(s:file)
    execute 'source' s:file
  endif
endfunction


call MyHookInit()
if exists("*MyHookBefore")
    call MyHookBefore()
endif
call MyPlugInit()
call MyOptionsInit()
call MyMapsInit()
if exists("*MyHookAfter")
    call MyHookAfter()
endif




