autocmd!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'freeo/vim-kalisi'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim'
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
Plug 'justinmk/vim-dirvish'

" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-haml'

" JS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-json'
Plug 'carlitux/deoplete-ternjs'
Plug 'steelsojka/deoplete-flow'

" HTML CSS
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] }

" Other Languages
Plug 'elixir-lang/vim-elixir'
Plug 'ElmCast/elm-vim'
Plug 'martin-svk/vim-yaml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-git'
Plug 'keith/tmux.vim'
Plug 'honza/dockerfile.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme kalisi
set background=dark

" Set 256 colors
set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set nocompatible

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set incsearch
set hlsearch

" Natural split changes
set splitbelow                              " Splitting a window will put the new window below the current
set splitright

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set cmdheight=1
set switchbuf=useopen
set showtabline=1
set winwidth=79

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Don't make backups at all
set nobackup
set nowritebackup

set backspace=indent,eol,start

" display incomplete commands
set showcmd

" Enable highlighting for syntax
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" make tab completion for files/buffers act like bash
set wildmenu

" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3

" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" If a file is changed outside of vim, automatically reload it without asking
set autoread

set backupdir=$HOME/.config/nvim/backup
set directory=$HOME/.config/nvim/tmp

" Map leader to space
let mapleader = "\<Space>"

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo folder. undo changes after closing and opening files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.config/nvim/undodir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off arrow movements
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Turn off mouse
set mouse=

" Clear search and redraw screen
nnoremap <C-L> :nohlsearch<CR><C-L>

" Show invisible characters
nmap <leader>i :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
if &encoding == 'utf-8'
    set listchars=tab:▸\ ,eol:¬,trail:·
endif

" Pretty print a json file
command! -nargs=0 Jqfile %!jq '.'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,scss,cucumber set ai sw=2 sts=2 et

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set sw=4 sts=4 et

" JSON highlighting
autocmd BufNewFile,BufRead *.json,*.template set ft=javascript

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOVIM SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1         " Set an environment variable to use the t_SI/t_EI hack
let loaded_netrwPlugin = 1
command! Explore :Dirvish %:p:h

