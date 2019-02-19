" setup vundle first
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'grep.vim'
Plugin 'justinmk/vim-sneak'
"Plugin 'AutoComplPop'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite-outline'
Plugin 'tsukkee/unite-tag'
Plugin 'gregsexton/gitv'
Plugin 'osyo-manga/vim-marching'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'nanotech/jellybeans.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Shougo/deoplete.nvim'
Plugin 'airblade/vim-gitgutter'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'fatih/vim-go'
Plugin 'kmnk/vim-unite-giti.git'
Plugin 'alaric/neovim-visor'
Plugin 'Shougo/neomru.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'keith/swift.vim'
Plugin 'Shougo/denite.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'jceb/vim-orgmode'
Plugin 'posva/vim-vue'
Plugin 'rdnetto/YCM-Generator'
Plugin 'Yggdroot/LeaderF'

" Colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'joshdick/onedark.vim'
Plugin 'arakashic/chromatica.nvim'


" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set wmh=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nnoremap <silent> <F8> :Tlist<CR>
"inoremap kj <Esc>
syntax on
"Newly added below
set nocp
filetype indent plugin on
filetype on
filetype plugin on
set hidden
set wildmenu
set showcmd
set backspace=indent,eol,start
set undofile
set undodir=~/.vimundo
"Newly added above ^^^
set ignorecase
set hlsearch
hi search term=bold ctermfg=white ctermbg=6
set incsearch
set expandtab
set autoindent
set smartindent
set copyindent
set ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4               " let backspace delete indent

tnoremap <esc><esc> <C-\><C-n>

"no backups
"set noswapfile
"set nobackup
"set nowb

"Prevent omni complete preview window
set completeopt-=preview
set background=dark
set bg=dark
"colorscheme molokai
"let g:zenburn_old_Visual = 1
"let g:zenburn_high_Contrast = 0
"let g:zenburn_alternate_Visual = 1
let g:zenburn_transparent = 1
let g:yankring_history_dir = "~/.vim/"
"Global clipboard all the time

"colorscheme zenburn
"colorscheme darkburn
"colorscheme mustang
"let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visbility="high"
"colorscheme jellybeans
"colorscheme gruvbox
let base16colorspace=256
"colorscheme hybrid
"colorscheme base16-oceanicnext
colorscheme PaperColor



set viminfo='100,f1
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"Show tabs and spaces
"set list listchars=tab:-\
"set listchars=trail:.
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
" option to stop auto-indent when copy-pasting from one window to another
set pastetoggle=<F6>
:vnoremap < <gv
:vnoremap > >gv
command -nargs=* Ma !make TARGET=ap7131 <args>
"command -nargs=* Ma silent execute "!make TARGET=ap7131 <args> > /dev/null" | redraw!
command -nargs=* Mf !make TARGET=qs1 <args>

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" // The switch of the Source Explorer
nmap <F9> :SrcExplToggle<CR>
nmap <F10> :CCTreeTraceReverse<CR>
nmap <F11> :CCTreeLoadDB<CR>

" // Set the window height of Source Explorer
let g:SrcExpl_winHeight = 12

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 500

" // Let the Source Explorer update the tags file when opening
"let g:SrcExpl_updateTags = 1

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
"let g:SrcExpl_gobackKey = "<SPACE>"

" // Do not let the Source Explorer update the tags file when opening          "
let g:SrcExpl_isUpdateTags = 0
"                                                                              "

"Grep plugin settings
:let Grep_Path = '/bin/egrep'
:let Grep_Default_Options = '--exclude-from ~/.sgrep-exclude -ir'

"More new stuff : Aug 2012
let mapleader=","
set smartcase
"set title
set history=1000
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
" Easy window navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

nmap <silent> <Leader>l :TagbarToggle<CR>
nnoremap <silent> <Leader>y :YRShow<CR>
"nnoremap <silent> <leader><space> :noh<CR>
"let g:ackprg="ack-grep -H --nocolor --nogroup --column"
map <leader>p :setlocal paste!<cr>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap <silent> <Leader>g :GundoToggle<CR>
map <leader>m :make! TARGET=qs1 NOISY=1<cr><cr>
map <leader>a :make! TARGET=qs1 tags<cr><cr>
map <leader>t :CtrlP<cr>
map <leader>q :ccl<cr>
map <leader>d :YcmCompleter GoTo<cr>

set encoding=utf-8
set laststatus=2
au FilterWritePre * if &diff | set laststatus=0 | endif
let g:tagbar_left = 1
"let g:Powerline_symbols = 'unicode'
let g:Powerline_mode_n = ' N '
let g:Powerline_mode_i = ' I '
let g:Powerline_mode_v = ' V '
let g:Powerline_color = ' V '
let SVNCommandEnableBufferSetup=1
"let g:loaded_fugitive = 1
"au BufWritePost *.c,*.cpp,*.h silent! !make TARGET=qs1 tags&
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
"set cursorline
cmap w!! w !sudo tee % >/dev/null
set switchbuf=usetab

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"set autochdir
"autocmd BufEnter * silent! lcd %:p:h
set errorformat^=%-GIn\ file\ included\ %.%# 
set diffopt+=vertical

hi TabLineFill ctermfg=white ctermbg=DarkGrey
hi TabLine ctermfg=White ctermbg=Grey
hi TabLineSel ctermfg=Black ctermbg=White
let g:ctrlp_working_path_mode = "a"
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '^V' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '^S' : 'S',
            \ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.whitespace = 'Ξ'
let g:syntastic_c_checkers=['']
let g:syntastic_c_remove_include_errors = 1

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='papercolor'

"let g:airline_symbols = 1
let g:airline#extensions#promptline#enabled = 1
"let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"
:nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
let g:sneak#s_next = 1
let g:sneak#streak = 1

" Start Insert
"let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 300

" set up mru limit
let g:unite_source_file_mru_limit = 100

" highlight like my vim
let g:unite_cursor_line_highlight = 'CursorLine'

" format mru
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" set up coolguy arrow prompt
let g:unite_prompt = '➜ '

" Save session automatically.
let g:unite_source_session_enable_auto_save = 1

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Default is to use tabopen
call unite#custom#default_action('file', 'tabswitch')
call unite#custom#default_action('grep', 'tabswitch')

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep,git,tag',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ 'lib/Cake/',
      \ 'node_modules/',
      \ 'vendor/',
      \ 'Vendor/',
      \ 'app_old/',
      \ 'acf-laravel/',
      \ 'plugins/',
      \ 'bower_components/',
      \ '.sass-cache',
      \ 'web/wp',
      \ ], '\|'))

" Unite Commands ===============================================================

" No prefix for unite, leader that bish
nnoremap [unite] <Nop>

" ;f Fuzzy Find Everything
" files, Buffers, recursive async file search
nnoremap <silent> <leader>f :<C-u>Unite -start-insert file_mru file_rec/neovim<CR>

" ;y Yank history
" Shows all your yanks, when you accidentally overwrite
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" ;o Quick outline, see an overview of this file
nnoremap <silent> <leader>o :<C-u>Unite -buffer-name=outline -start-insert outline<CR>

" ;m MRU All Vim buffers, not file buffer
"nnoremap <silent> <leader>m :<C-u>Unite -buffer-name=mru file_mru<CR>

" ;b view open buffers
nnoremap <silent> <leader>b :<C-u>Unite -buffer-name=buffer buffer<CR>

" ;c Quick commands, lists all available vim commands
nnoremap <silent> <leader>c :<C-u>Unite -buffer-name=commands command<CR>


"nnoremap <Leader>/ :<C-u>UniteWithCursorWord -no-quit -silent -default-action=tabswitch grep<CR>
nnoremap <Leader>/ :<C-u>:Unite line -buffer-name=lines -start-insert -direction=botright<CR>

"nnoremap <Leader>s :<C-u>DeniteCursorWord -no-quit -default-action=open grep:.<CR>
nnoremap <Leader>s :<C-u>UniteWithCursorWord -no-quit -silent -default-action=open grep:.<CR>
"noremap <Leader>s: <C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>


nnoremap <Leader>t :<C-u>UniteWithCursorWord -no-quit -silent -default-action=tabswitch tag:!<CR>
nnoremap <Leader>u :<C-u>UniteClose<CR>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --smart-case'
"let g:unite_source_grep_command = 'rg'
"let g:unite_source_grep_default_opts = '--hidden --no-heading --vimgrep'
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>r ::YcmCompleter GoTo<CR>


set switchbuf=usetab,newtab

nnoremap <silent> <leader>w :<C-u>wincmd w<CR>

let g:marching_clang_command = 'clang-3.5'
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns={}
endif
let g:neocomplete#force_omni_input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)'
let g:marching#clang_command#options = { 'cpp' : '-Wall -std=gnu++1y', 'c' : '-Wall -std=c99' }
let g:neocomplete#sources#include#paths ={
        \ 'cpp':  '.,/opt/local/include/gcc46/c++,/opt/local/include,/usr/include',
        \ 'c':    '.,/usr/include,./inc,./include',
        \ 'ruby': '.,$HOME/.rvm/rubies/**/lib/ruby/1.8/',
        \ }

let g:neocomplete#sources#include#patterns = {
  \ 'cpp':  '^\s*#\s*include',
  \ 'c':    '^\s*#\s*include',
  \ 'ruby': '^\s*require',
  \ 'perl': '^\s*use',
  \ }

let g:Gitv_OpenHorizontal = 1
set foldlevelstart=20

let g:easytags_file = '~/.vim/tags'
set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
let g:terminal_scrollback_buffer_size = 100000

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1

" tabs
"set list listchars=tab:▸.,trail:.,extends:#,nbsp:.
set ttyfast

 " visor style terminal buffer
let s:termbuf = 0
function! ToggleTerm()
 topleft 15 split
 try
     exe 'buffer' . s:termbuf
     startinsert
 catch
     terminal
     let s:termbuf=bufnr('%')
     tnoremap <buffer> <A-t>  <C-\><C-n>:close<cr>
 endtry
endfunction

com! ToggleTerm call ToggleTerm()
nnoremap <leader>v :ToggleTerm<cr>
nnoremap <leader>n :NERDTreeToggle<cr>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

set clipboard+=unnamed
let g:neovim_visor_key = '<leader>e'
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
let g:ycm_confirm_extra_conf = 0
let g:chromatica#enable_at_startup=0
" Denite stuff

call denite#custom#option('default', {
      \ 'prompt': '➜ '
      \ })

call denite#custom#var('file_rec', 'command',
      \ ['ag', '--files', '--glob', '!.git', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
