" General
set noautochdir         " Don't chdir to the location where the file is by default
set confirm             " Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set mouse=a             " Enable use of the mouse for all modes
set nobackup            " Don't create backup files
set noswapfile          " Don't create swap files
syntax enable           " enable syntax processing

" Spaces & Tabs 
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4        " when indenting with '>', use 4 spaces width
set modelines=1
set autoindent
filetype indent on      " load filetype-specific indent files
filetype plugin on
" Tab in normal mode is used to jump between parenthesis
nnoremap <tab> %
vnoremap <tab> %

" UI Layout
set number              " show line numbers
set relativenumber      " show relative line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to (e.g. don't redraw while executing macros)
set showmatch           " higlight matching parenthesis
set wildmenu            " visual autocomplete for command menu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc   " Ignore compiled files

" Searching 
set ignorecase smartcase          " make searches case-insensitive, unless they contain upper-case letters
set incsearch           " search as characters are entered
set incsearch showmatch hlsearch  " show the `best match so far' as search strings are typed and highlight it
" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :noh<CR><C-L>

" Folding
set foldmethod=indent   " fold based on indent level
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " max 10 nested fold
" space open/closes folds
nnoremap <space> za

" Line Shortcuts
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Window
set splitright          " Force vsplit to open new window on the right
set splitbelow          " Force vsplit to open new window below
" Move between split windows more naturally
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
" replaces the 'Redraw screen' action. :redraw doesn't do the same thing.
map <C-L> <C-W>l

" vim's status line
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%#Error#                     " color highlight for Syntastic error
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic error location
set statusline+=%*                           " reset highlight
set statusline+=%-8.(%)                      " offset
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set laststatus=2        " Always display statusline, even if there's only one window in vim

" Git - Displaying git content in a split window
" move the cursor to line 0 if doing a git commit
" autocmd BufRead *.git/COMMIT_EDITMSG 0
" split window with currect git diff --cached
" autocmd BufRead *.git/COMMIT_EDITMSG DiffGitCached -C --patch --stat --no-ext-diff | wincmd L

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" declare plugins
silent! if plug#begin()

    " NERD tree will be loaded on the first invocation of NERDTreeToggle command
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    " Jellybeans color scheme
    Plug 'nanotech/jellybeans.vim'
    " a syntax checking plugin for Vim that integrates with external syntax checkers to provide in-editor feedback on your code as you make changes
    Plug 'scrooloose/syntastic'
    " JSON support
    Plug 'elzr/vim-json'
    " Comments
    Plug 'tpope/vim-commentary'
    " Surround text with parentheses, brackets, quotes, XML tags, and more
    Plug 'tpope/vim-surround'

  call plug#end()
endif

" Colors 
colorscheme jellybeans
set t_ut=               " disable Background Color Erase (BCE) so color schemes work properly when Vim is used inside tmux and GNU screen

