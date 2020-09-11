
" Vim-Plug configuration ======================================================

let g:plug_shallow=0

function! CondPlugin(cond, ...)
    " Allows for conditional use of plugins
    " e.g. Plug 'benekastah/neomake', Cond(has('nvim'), { 'on': 'Neomake' })
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.local/share/nvim/plugged')

" These plugins require: Python 3, Ruby, and Node.js providers for Neovim

Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'danro/rename.vim'
Plug 'derekwyatt/vim-scala'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'idanarye/vim-vebugger'
Plug 'jceb/vim-orgmode'
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/vim-plug'
Plug 'kassio/neoterm'
Plug 'kustosz/vim-enso-syntax'
Plug 'lervag/vimtex'
Plug 'lifepillar/vim-solarized8'
Plug 'LnL7/vim-nix'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mhinz/neovim-remote', { 'do': 'pip3 install --user neovim-remote' }
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile' }
Plug 'neomake/neomake'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'Olical/vim-enmasse'
Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/denite.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'terryma/vim-expand-region'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/AdvancedSorters'
Plug 'vim-scripts/vim-task-org'
Plug 'vimwiki/vimwiki'
Plug 'yaroot/vissort'

" Non-Alphabetical as Load-Order Dependent
Plug 'ryanoasis/vim-devicons'

call plug#end()

" BASIC EDITOR CONFIGURATION ==================================================

" Basic Nvim Configuration
filetype plugin indent on
imap <S-Tab> <BS>
set autoindent
set cursorline
set expandtab
set number
set pumheight=10
set ruler
set scrollback=1000
set scrolloff=10
set smartindent
set softtabstop=4
set sw=4
set tabstop=4
set wrap

" Colour Schemes for Vim
set termguicolors
set background=dark
colorscheme solarized8
let g:solarized_termtrans=1
let g:solarized_visibility="low"
let g:solarized_diffmode="low"
let g:solarized_statusline="low"
syntax enable

" Highlights
highlight CocErrorSign guifg=#dc322f
highlight CocWarningSign guifg=#cb4b16
highlight CocInfoSign guifg=#b58900
highlight CocHintSign guifg=#6c71c4

highlight ColorColumn guibg=#073642
highlight CursorLine guibg=#073642

" Rulers
let &colorcolumn=join([81,101],",")

" Splits Control
set splitbelow
set splitright

" Folding Configuration
set foldmethod=manual
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<CR>
vnoremap <space> zf

" Diff Configuration
if &diff
    " diff mode
    set diffopt+=iwhite
endif

" Improvements to Pasting
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Clipboard
set clipboard=unnamed

" Leader Configuration
let mapleader=","
set timeout timeoutlen=1000

" Listings Configuration
set list
set showbreak=↪\
set listchars=tab:\ \ ,trail:·,precedes:«,extends:»,nbsp:␣

" Spellchecking Configuration
set spell
set spelllang=en_gb

" Undo Configuration
if has("persistent_undo")
    set undofile
    set undolevels=10000

    " Allows undoing of reloading a file
    set undoreload=10000
endif

" Buffer Navigation Configuration
nmap <leader>bn :enew<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bj :bnext<CR>
nmap <leader>bk :bprevious<CR>
nmap <leader>bl :ls<CR>

" Tab Navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap tq  :tabclose<CR>

" Python Support
set pyx=3
let g:loaded_python_provider = 1 " Disable Py2

if has('mac')
    let g:python3_host_prog = '/usr/local/bin/python3'
elseif has('unix')
    let g:python3_host_prog = '/usr/bin/python3'
else
    let g:python3_host_prog = 'C:\development\python\bin\python'
endif

" Search Configuration
set incsearch
set hlsearch
set ignorecase
set smartcase
set inccommand=nosplit
nnoremap <leader><space> :nohlsearch<CR>
command! H :noh
nmap <space> zz
nmap n nzz
nmap N Nzz

" Session Options
set ssop-=options

" Command Line Completion Setup
set wildmode=longest,list,full
set wildmenu

" Program Title String
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\
            \%{v:servername}

" Terminal Mode Changes
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <Esc> <C-\><C-n>

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" General Navigation Commands
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Help Configuration
:cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == "h" ? "vert h" : "h"

" USEFUL FUNCTIONS ============================================================

" Reload Vim Configuration While Editing
command! Reload :so %

" Prevent visual paste from overwriting paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Toggle Maximise state of split
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Whitespace Sripping
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

nnoremap <leader><leader>ws :call <SID>StripTrailingWhitespaces() <CR>

let blacklist = ['markdown', 'ruby', 'perl', 'javascript']

autocmd BufWritePre * if index(blacklist, &ft) < 0 |
            \:call <SID>StripTrailingWhitespaces()

" Visual Range Selection by Typing
command! -range Vis call setpos('.', [0,<line1>,0,0]) |
            \ exe "normal V" |
            \ call setpos('.', [0,<line2>,0,0])

command! Ses :source Session.vim

" Visual Macro Application
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" FILETYPE SPECIFIC OPTIONS ===================================================

" Make
autocmd FileType typescript set expandtab shiftwidth=2 softtabstop=2

" Make
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" Assembly
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm

" JSONC
autocmd FileType json syntax match Comment +\/\/.\+$+

" VIM PLUGIN CONFIGURATION ====================================================

" Coc.nvim Configuration
"
" Needs Node and Yarn installed.
" Installed Language Servers (Most from AUR or Brew)
" - [CCLS](https://github.com/MaskRay/ccls/)
" - [Haskell IDE Engine](https://github.com/haskell/haskell-ide-engine)
" - [metals](https://scalameta.org/metals/)

call coc#add_extension('coc-calc')
call coc#add_extension('coc-dictionary')
call coc#add_extension('coc-emoji')
call coc#add_extension('coc-fsharp')
call coc#add_extension('coc-git')
call coc#add_extension('coc-github')
call coc#add_extension('coc-gitignore')
call coc#add_extension('coc-highlight')
call coc#add_extension('coc-html')
call coc#add_extension('coc-java')
call coc#add_extension('coc-json')
call coc#add_extension('coc-lists')
call coc#add_extension('coc-lua')
call coc#add_extension('coc-marketplace')
call coc#add_extension('coc-metals')
call coc#add_extension('coc-omnisharp')
call coc#add_extension('coc-powershell')
call coc#add_extension('coc-project')
call coc#add_extension('coc-python')
call coc#add_extension('coc-rust-analyzer')
call coc#add_extension('coc-sh')
call coc#add_extension('coc-sql')
call coc#add_extension('coc-svg')
call coc#add_extension('coc-syntax')
call coc#add_extension('coc-texlab')
call coc#add_extension('coc-tsserver')
call coc#add_extension('coc-utils')
call coc#add_extension('coc-vimlsp')
call coc#add_extension('coc-vimtex')
call coc#add_extension('coc-xml')
call coc#add_extension('coc-yaml')

set hidden
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nn <silent> H :call CocActionAsync('doHover')<CR>

nn <silent> <leader><leader>l :CocList<CR>

nn <silent> <leader><leader>crs :call CocActionAsync('rename')<CR>
nn <silent> <leader><leader>css :call CocActionAsync('sourceStat')<CR>
nn <silent> <leader><leader>cjd :call CocActionAsync('jumpDefinition')<CR>
nn <silent> <leader><leader>cjc :call CocActionAsync('jumpDeclaration')<CR>
nn <silent> <leader><leader>cji :call CocActionAsync('jumpImplementation')<CR>
nn <silent> <leader><leader>csl :call CocActionAsync('documentSymbols')<CR>
nn <silent> <leader><leader>ccf :call CocActionAsync('formatSelected')<CR>
nn <silent> <leader><leader>cca :call CocActionAsync('codeAction')<CR>
nn <silent> <leader><leader>cla :call CocActionAsync('codeLensAction')<CR>
nn <silent> <leader><leader>clc :call CocActionAsync('commands')<CR>
nn <silent> <leader><leader>crc :call CocActionAsync('runCommand')<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

let g:coc_start_at_startup = 1
let g:coc_status_error_sign = '❯'
let g:coc_status_warning_sign = '❯'
let g:coc_status_info_sign = '❯'
let g:coc_status_message_sign = '❯'

" Vim Tmux Navigator Configuration
let g:tmux_navigator_save_on_switch = 2
let g:tmux_nagigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft <CR>
nnoremap <silent> <C-l> :TmuxNavigateRight <CR>
nnoremap <silent> <C-j> :TmuxNavigateDown <CR>
nnoremap <silent> <C-k> :TmuxNavigateUp <CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious <CR>

" Vim Airline Configuration
set laststatus=2
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extentions#tabline#fnamemod=":t"

" Vim-Easymotion Configuration
nmap s <Plug>(easymotion-s)

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Incsearch Configuration
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

function! s:config_easyfuzzymotion(...) abort
return extend(copy({
\   'converters': [incsearch#config#fuzzy#converter()],
\   'modules': [incsearch#config#easymotion#module()],
\   'keymap': {"\<CR>": '<Over>(easymotion)'},
\   'is_expr': 0,
\   'is_stay': 1
\ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

map f/ <Plug>(incsearch-fuzzy-/)
map f? <Plug>(incsearch-fuzzy-?)
map fg/ <Plug>(incsearch-fuzzy-stay)

" Intero Neovim Configuration
let g:intero_type_on_hover = 0
let g:intero_start_immediately = 0
let g:intero_use_neomake = 1
let g:intero_window_size = 15
let g:intero_ghci_options = '-fobject-code'

function! InteroAutoReload()
    if g:intero_started
        :InteroReload
    endif
endfunction

augroup InteroMaps
    au!

    " Process Management
    au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
    au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

    " Open intero/GHCi split horizontally
    au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>

    " Open intero/GHCi split vertically
    au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
    au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

    " Automatically reload on save
    au BufWritePost *.hs :call InteroAutoReload()
    au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

    " Load individual modules
    au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
    au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

    " Type-related information
    " Heads up! These next two differ from the rest.
    au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
    au FileType haskell map <silent> <leader>T <Plug>InteroType
    au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>
    au FileType haskell nnoremap <silent> <leader>ii :InteroInfo<CR>

    " Navigation
    au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
    au FileType haskell nnoremap <silent> <leader>ie :InteroEval<CR>

    " Managing targets
    " Prompts you to enter targets (no silent):
    au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Fugitive Configuration
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

" Gitgutter Configuration
let g:gitgitter_max_signs = 5000

" Nerdcommenter Configuration
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Nerdtree Configuration
nnoremap T :NERDTreeToggle<CR>

" Nerdtree Tabs Configuration
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_startup_cd = 1

" Undotree Configuration
nnoremap U :UndotreeToggle<CR>
nnoremap UE :earlier<CR>
nnoremap UL :later<CR>

let g:undotree_WindowLayout = 1
let g:undotree_DiffpanelHeight = 15

" Vim-Task-Org Configuration
let g:vtoAuthorName = 'Ara Adkins'
let g:vtoTokenList = [":BUG:", ":FIXME:", ":TODO:", ":TRICKY:", ":WARNING:",
            \"TODO", "FIXME", "BUG", "TRICKY", "WARNING", "BUG:", "FIXME:",
            \"TODO:", "TRICKY:", "WARNING:"]
let g:vtoDateFormat = "%y-%m-%d %T"

" Vim Expand Region Configuration
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ })

" Haskell-Vim Configuration
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1

let g:haskell_indent_disable = 1

" Denite.vim Configuration
autocmd filetype denite call s:denite_my_mappings()

function! s:denite_my_mappings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

augroup deniteresize
  autocmd!
  autocmd VimResized,VimEnter * call denite#custom#option('default',
        \{'winheight': winheight(0) / 3})
augroup end

call denite#custom#option('default', {'winheight': winheight(0)/4})

call denite#custom#var('file/rec', 'command',
            \ ['rg', '--follow', '--hidden', '--files', '--glob', '!.git'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
            \ ['--follow', '--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <C-p> :Denite file/rec <CR>
nnoremap <C-e> :Denite buffer<CR>
nnoremap <C-i> :Denite grep <CR>
nnoremap <C-o> :Denite line register<CR>

" Neomake Configuration
call neomake#configure#automake('rnw', 250)

let g:neomake_error_sign = {
    \ 'text': '❯',
    \ 'texthl': 'helpSpecial',
    \ }

let g:neomake_warning_sign = {
    \ 'text': '❯',
    \ 'texthl': 'vimCommand',
    \ }

let g:neomake_message_sign = {
    \ 'text': '❯',
    \ 'texthl': 'helpOption',
    \ }

let g:neomake_info_sign = {
    \ 'text': '❯',
    \ 'texthl': 'vimIsCommand',
    \ }

let g:neomake_haskell_enabled_makers = ['']
let g:neomake_python_enabled_makers = ['']

" Neoterm Configuration
let g:neoterm_default_mod = ':botright'

nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)

" Neovim Remote Configuration
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

" Vim-Devicons Configuration
let g:webdevicons_enable = 1

let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_nerdtree = 1

" Vebugger Configuration
let g:vebugger_leader='<leader>d'

" Projectionist Configuration
autocmd User ProjectionistActivate :Pcd

" Vim-Markdown Configuration
let g:vim_markdown_folding_disabled = 1

au FileType markdown set conceallevel=0

" Vissort Configuration
let g:vissort_option="i"

" Vim-Scala Configuration
let g:scala_scaladoc_indent = 1
au BufRead,BufNewFile *.sbt set filetype=scala

" Signify Configuration
let g:signify_vcs_list = ["git", "hg"]
let g:signify_realtime = 1

highlight SignColumn ctermbg=0 cterm=NONE guibg=NONE gui=NONE

" Vimtex Configuration
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'

