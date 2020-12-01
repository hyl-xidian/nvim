""                                  _                    
""       _ __ ___  _   _     __   _(_)_ __ ___  _ __ ___ 
""      | '_ ` _ \| | | |____\ \ / / | '_ ` _ \| '__/ __|
""      | | | | | | |_| |_____\ V /| | | | | | | | | (__ 
""      |_| |_| |_|\__, |      \_/ |_|_| |_| |_|_|  \___|
""                 |___/                                 

" Appereance {{{
set background=dark

"color koehler
"color molokai
color gruvbox

" For gvim
set guifont=SauceCodePro\ Nerd\ Font\ Mono\ 14

" Displays the Status Line on the second to last line of the window
set laststatus=2

" Set the statusline
" Preview all highlight groups with `:so $VIMRUNTIME/syntax/hitest.vim
set statusline=
"set statusline+=%#Normal#
"set statusline+=%{StatuslineGit()}
set statusline+=%#Keyword#
set statusline+=\ %F
set statusline+=%m
set statusline+=%=
set statusline+=%#Normal#
set statusline+=\ %l,%c
set statusline+=%#Keyword#
set statusline+=\ %p%%
set statusline+=%#Normal#
set statusline+=\ %{&fileformat}:%{&fileencoding?&fileencoding:&encoding}
set statusline+=%#Keyword#
set statusline+=\%y

"}}}

" Editor Behavior {{{
"" ===
"" === Editor Behavior
"" ===
"
"" ===
"" TWO important settings
"" ===

"" The length of time Vim waits after you stop typing before it triggers the plugin is governed by the setting updatetime.
"" DEFAULT:4000(ms)
"
"" Affected functions:
"" vim-gitgutter
set updatetime=600

"" Key-specific timeoutlen in vim
"" Example: In normal mode, the 'b' key has been bound to Buffer related operations. Like:bd
"" bs, but 'b' key also has its default functions--'go back to the previous
"" word'. So there will be a short delay everytime you press the 'b' key.
""
"" 'timeoutlen' is the length of the delay time.
"" The keys you have typed during the delay time will be identified as
"" 'Specific-key'
"" Example: if you type 'b' and 'd' within TIMEOUTLEN, the vim will trigger
"" 'buffer down'
""
"" Affected bindings:
"" 'oh oj ok ol' and 'o'
"" 'bh bj bk bl bs bd' and 'b'
set timeoutlen=500
nnoremap B b
nnoremap O o
nnoremap o <nop>

" Do not load the 'matchparen' plugin
" Path: /usr/share/vim/vim82/plugin/matchparen.vim
" Describe: Highlight the matching brackets
let loaded_matchparen = 1

" Turn off the bracket matching
" '%' go to the previous bracket
set noshowmatch

set lazyredraw
set ttyfast

"" Make the configuration file take effect immediately
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"" Automatically matches the right bracket when you enter a left bracket
"set showmatch

"set autoread
"set autowriteall

" Display the current line number
set number
" Display relative line numbers
set relativenumber
" Show the line numbers(absolute) of the line 
" where the cursor is located
set ruler

" Highlight the line/column where the cursor is located
"set cursorline
"set cursorcolumn

" Show invisible characters
set list
" Set which symbol to display invisible characters
set listchars=tab:>-,trail:-

" Syntax highlighting
syntax on

" C++ indent
set cindent
"set smartindent

" Tab key:The increased indent will be converted to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Search:
" Highlight matching results
set hlsearch
" Enter a character and match it automatically
set incsearch

" Search for content that contains uppercase characters, it performs a case sensitive search; 
" if it searches for content that is only lowercase, it performs a case insensitive search
set ignorecase
set smartcase

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Press backspace key on the start of the current line 
" can go back to the previous line
set backspace=indent,eol,start

" Make cursor stay at the last position of last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" When scroll up and down, the cursor position is always 6 lines from the 
" top/bottom
set scrolloff=6

" Enable file type checking
filetype on
filetype plugin indent on

" Search down into subfolders
" Provides tab-completion for all file -related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

" Set Codings
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set hidden

" Retain revocation history
set undofile
set undodir=$HOME/.config/nvim_undofiles
" Stop generating swap files
set noswapfile
set history=1000
set showcmd

set autochdir
" Auto change directory to current dir
"autocmd BufEnter * silent! lcd %:p:h
"" Correct spelling
"set spell

"}}}

" Key Mappings {{{
" Basic Mappings {{{
"" ===
"" === Basic Mappings
"" ===
" define 'space' as <LEADER>
let mapleader=" "
"" Attention!!!!
"" Don't bind any insert-mode operations to <LEADER>!!!!
"" If you are using <SPACE> as mapleader

" Press <SPACE> twice to jump to the next '<++>' and edit it
" as similiar as a place-holder
nnoremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" space + enter means no high light, very useful!!!!
nnoremap <LEADER><CR> :nohlsearch<CR>

" copy/paste to the System clipboard
"

"Nvim has no direct connection to the system clipboard. Instead it depends on
"a |provider| which transparently uses shell commands to communicate with the
"system clipboard or any other clipboard "backend".
"
" BACKEND: xclip (if $DISPLAY is set)
"
"" ctrl + ;
"" open a memu to select contents from history system clipboard
"" <Tab> to switch around results
"" <Space> to paste the chosen contents
vnoremap <LEADER>y "+y
nnoremap <LEADER>p "+p

" Press F4 to toggle syntax
nnoremap <F4> :exec exists('syntax_on') ? 'syn off': 'syn on'<CR>

" Faster save and quit
map S :w<CR>
map Q :q<CR>

nnoremap ; :
"}}}

" Cursor Movement {{{
"" ===
"" === Cursor Movement
"" ===
" Faster in-line navigation
noremap K 5k
noremap J 5j

" Copy from the cursor location to the end of the line
nnoremap Y y$

"" 0 key: go to the start of the current line
"" - key: go to the end of the current line
noremap - $
"}}}

" Command Mode Cursor Movement {{{
"" ===
"" === Command Mode Cursor Movement
"" ===
cnoremap <C-h> <Left>
cnoremap <C-l> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
"}}}

" Window Management {{{
"" ===
"" === Window Management
"" ===
" Use <space> + new arrow keys for moving the cursor around windows
nmap <LEADER>h <C-w>h
nmap <LEADER>l <C-w>l
nmap <LEADER>j <C-w>j
nmap <LEADER>k <C-w>k

" Disable the default s key
map s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical) and open a new file with ranger
noremap ok :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>:RangerCurrentFile<CR>
noremap oj :set splitbelow<CR>:split<CR>:RangerCurrentFile<CR>
noremap oh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>:RangerCurrentFile<CR>
noremap ol :set splitright<CR>:vsplit<CR>:RangerCurrentFile<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Press <SPACE> + q to close the window below the current window
nnoremap <LEADER>q <C-w>j:q<CR>
"}}}

" Tab Management {{{
"" ===
"" === Tab Management
"" ===
" move around tabs with 'th' and 'tl'
nmap tl :+tabnext<CR>
nmap th :-tabnext<CR>
" open a new tab
nmap tn :tabnew<CR>
"}}}

" Buffer Management {{{

"" :ls b --Show all exited buffers
"" :b NUM --Specify the NUMth buffer
" Buffer Previous
nnoremap bh :bp<CR>
" Buffer Next
nnoremap bl :bn<CR>
" Buffer Down --Shutdown the current buffer
nnoremap bd :bd<CR>
" List the buffers
nnoremap bs :ls b<CR>
"}}}
"}}}

" Plugins {{{
" Install {{{
"" ===
"" install plug
"" ===
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-bufferline'
" Undo Tree
Plug 'mbbill/undotree'
" Git status plug
Plug 'airblade/vim-gitgutter'
"" FZF
""" Attention:fzf requirs Neovim 0.4+
""" Dependency:Ripgrep
""" INSTALL: for Ubuntu 18.04
""" curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
""" sudo dpkg -i ripgrep_12.1.1_amd64.deb
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" Lazygit
Plug 'kdheepak/lazygit.nvim'

"" wildfire + surround
" With Wildfire you can quickly select the closest text object among a group of candidates.
Plug 'gcmt/wildfire.vim'
" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

"" markdown
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" markdown table mode
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" Markdown TOC
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

"" Markdown preview
"" Execute commands `:call mkdp#util#install()` after installation.
"" Ps: privoxy' may be needed
"call minpac#add('iamcco/markdown-preview.nvim', {'type': 'start', 'for':'markdown'})

" devicons
"Plug 'ryanoasis/vim-devicons'
call plug#end()
"}}}

" Configurations {{{
"" ===
"" === Netrw
"" ===
nnoremap <LEADER>e :Vexplore<CR>
" 25% of the window
let g:netrw_winsize=25
" 0 means No Banner!
" 'I' key: Toggle the displaying of the banner
let g:netrw_banner=0
"" 1. Use the horizontal split window to open the file
"" 2. Vertically split the window to open the file
"" 3. Open the file with a new tab
"" 4. Use the previous window to open the file
let g:netrw_browse_split=4
" 'i' key: Cycle between thin, long, wide, and tree listings
""liststyle:thin/long/wide/tree
let g:netrw_liststyle=3


"" ===
"" === Buffer line
"" ===
"let g:bufferline_active_buffer_left = '{'
"let g:bufferline_active_buffer_right = '}'


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
"noremap to :XTabCycleMode<CR>
"noremap \p :echo expand('%:p')<CR>


" ===
" === Undotree
" ===
nnoremap <LEADER>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc


"" ===
"" git status plug
"" vim-gitgutter
"" ===
"" You can jump between hunks with [c and ]c. You can preview, stage, and undo
"" hunks with <leader>hp, <leader>hs, and <leader>hu respectively.
" remove the limits of the size of signs
let g:gitgutter_max_signs = -1
" make background colours match the sign column
let g:gitgutter_set_sign_backgrounds = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" ===
" === FZF
" ===
" Search in files in the current directory
nnoremap <silent> <C-p> :Files<CR>
" Search in use ripgrep
" `sudo pacman -S ripgrep`
nnoremap <silent> <C-f> :Rg<CR>
"" Search in ctags
"noremap <C-t> :BTags<CR>
" Search in lines of the current file
nnoremap <silent> <C-l> :Lines<CR>
" Search in buffers
nnoremap <silent> <C-b> :Buffers<CR>
" History of opened files
nnoremap <silent> <C-h> :History<CR>
" Commands History
nnoremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


"" ===
"" === Ranger
"" ===
nnoremap <LEADER>o :RangerCurrentDirectoryNewTab<CR>
nnoremap <LEADER>n :RangerCurrentFile<CR>

"" ===
"" === Lazygit
"" ===
let g:lazygit_floating_window_scaling_factor = 0.8 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
nnoremap <F3> :LazyGit<CR>


"" ===
"" vim table mode for markdown
"" ===
map tm :TableModeToggle<CR>


"" ===
"" vim markdown preview
"" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" " let g:instant_markdown_allow_unsafe_content = 1
" " let g:instant_markdown_allow_external_content = 0
" " let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1


"" ===
"" === Markdown TOC
"" ===
let g:vmt_cycle_list_item_markers = 1

"}}}
"}}}

" Useful Functions {{{
" Fcitx Control {{{
"" ===
"" fcitx control
"" when exiting from insert mode, the fcitx switches to en_US automatically
"" http://fcitx.github.io/handbook/chapter-remote.html
"" ===
let g:input_toggle = 1
function! Fcitx2en()
let s:input_status = system("fcitx-remote")
if s:input_status == 2
    let g:input_toggle = 1
    let l:a = system("fcitx-remote -c")
endif
endfunction

"function! Fcitx2zh()
"    let s:input_status = system("fcitx-remote")
"    if s:input_status != 2 && g:input_toggle == 1
"        let l:a = system("fcitx-remote -o")
"        let g:input_toggle = 0
"    endif
"endfunction

"" when entering in insert mode, switches to zh_CN automatically
"" default : close
"autocmd InsertEnter * call Fcitx2zh()

autocmd InsertLeave * call Fcitx2en()

"}}}

" CompileRunGcc {{{
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
	set splitbelow
	exec "!g++ -std=c++11 % -Wall -o %<"
	:sp
    :res -8
	:term ./%<
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
elseif &filetype == 'sh'
    :!time bash %
elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
elseif &filetype == 'html'
    exec "!".g:mkdp_browser." % &"
elseif &filetype == 'markdown'
    exec "MarkdownPreview"
elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
endif
endfunc

noremap <C-r> :call CompileRunGcc()<CR><C-w>k
"}}}

" Git-Branch Name {{{
"" ===
"" === Get the name of git branch
"" ===
function! GitBranch()
return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
let l:branchname = GitBranch()
return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
"}}}
"}}}

" Snippets {{{
" Markdown Snippets {{{
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
"autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,n - [ ] 
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
"}}}

" C++ Snippets {{{
autocmd Filetype cpp,c inoremap <buffer> ,for <Esc>:-1read$HOME/.vim/code-snippets/c++_for_.snippets<CR>
"}}}
"}}}

" vim:set fdm=marker:
