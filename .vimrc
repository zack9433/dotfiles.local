" .vimrc by othree ( othree AT gmail DOT com )

" Vundle
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Colors
Plugin 'jellybeans.vim'

Plugin 'bling/vim-airline'

" Improve
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'VisIncr'
Plugin 'junegunn/vim-easy-align'
Plugin 'othree/eregex.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'spiiph/vim-space'
Plugin 'AndrewRadev/switch.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-expand-region'
Plugin 'lfilho/cosco.vim'

" Complete
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim.git'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'airblade/vim-gitgutter'

Plugin 'Lokatog/vim-easymotion'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

" Tim Pope
Plugin 'tpope/vim-surround'

" Filetype
Plugin 'SyntaxRange'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'othree/xml.vim'

" JavaScript
Plugin 'othree/vim-javascript-syntax'
Plugin 'JSON.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/jspc.vim'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

Plugin 'nginx.vim'

" CSS, SCSS
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'plasticboy/vim-markdown'

" ctags
" Plugin 'majutsushi/tagbar'

" supertab
Plugin 'ervandew/supertab'

" multiple cursor
Plugin 'terryma/vim-multiple-cursors'

" editorconfig
Plugin 'editorconfig/editorconfig-vim'

" ag.vim
Plugin 'rking/ag.vim'

" Make Ctrl-P plugin a lot faster for Git projects
Plugin 'vim-scripts/gitignore'

" Seamless navigation between tmux panes and vim splits
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'Shutnik/jshint2.vim'

" Dockerfile syntax
Plugin 'ekalinin/Dockerfile.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Basic Settings: {{{
syntax on
filetype on
filetype plugin on
filetype indent on
set background=dark
colors jellybeans
language message zh_TW.UTF-8

set nocompatible
set display+=lastline
set wrap
set showtabline=2 " always show tab line
set ruler
set nu
set nuw=5
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set hlsearch
set foldmethod=marker
set backspace=indent,eol,start whichwrap+=<,>,[,]
set hidden
set nobomb
set hlsearch
set nobackup
set backupcopy=yes
set noswapfile
set textwidth=80

" set guicolors

let mapleader = ","

" Status Line
set laststatus=2

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,big5
set ambiwidth=double
set t_Co=256

" Status Line
" set laststatus=2
" set statusline=%f\ %y%r%1*%m%*\ %{g:HahHah()}%=%<\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ %4c\ %4l\ [%P]
" " set statusline=%=%{g:HahHah()}

" Special File Types
au BufRead,BufNewFile *nginx* set ft=nginx
au BufRead,BufNewFile *.vroom set ft=vroom
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.tpl set ft=html
au BufRead,BufNewFile *.xsl set ft=html
au BufRead,BufNewFile *.json set syntax=json
au BufRead,BufNewFile *.n3  set ft=n3
au BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx
au BufRead,BufNewFile /etc/nginx/* set ft=nginx
au BufRead,BufNewFile *.hbs set ft=handlebars
" au BufRead,BufNewFile *.rb set sw=2 sts=2 st=2
" au BufRead,BufNewFile *.rake set sw=2 sts=2 st=2
" au BufRead,BufNewFile *.ls set sw=2 sts=2 st=2
au BufNewFile,BufReadPost *.ls setl foldmethod=indent nofoldenable

" highlight line & column
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" highlight the 80th column
"
" In Vim >= 7.3, also highlight columns 120+
if exists('+colorcolumn')
  " (I picked 120-320 because you have to provide an upper bound and 500 seems
  " to be enough.)
  let &colorcolumn="80,".join(range(120,500),",")
else
  " fallback for Vim < v7.3
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Color Tweak for highlight
" highlight CursorLine    ctermbg=89
" highlight Comment       ctermfg=246
highlight ColorColumn   ctermbg=235 guibg=#2c2d27

" }}}

" FileType: {{{
"" omnifunc setting
setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=ccomplete#Complete
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType scss set sw=2

autocmd FileType coffee set ts=2 sw=2 sts=2
autocmd FileType vim set ts=2 sw=2 sts=2

autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-]>") |
    \ endif

let g:omni_syntax_group_include_javascript = 'javascript\w\+,jquery\w\+,underscore\w\+,prelude\w\+,requirejs\w\+'
" }}}

" NERDTree: {{{
" NERDtree settings
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_autoclose = 1
" }}}

" YouCompleteMe: {{{
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'coffee' : ['.', '["', "['"],
  \   'javascript' : ['.', '["', "['", 'new '],
  \ }
" }}}

" JS Libs: {{{
let g:used_javascript_libs = 'angularjs,backbone,jquery,lodash,requirejs'
" }}}

" Screen Fix: {{{
if &term =~ '^screen'
    set t_k1=[11~
    set t_k2=[12~
    set t_k3=[13~
    set t_k4=[14~
endif
" }}}

" QuickFix: {{{
" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nnoremap <leader>q :QFix<CR>

" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" http://vim.wikia.com/wiki/Automatically_quit_Vim_if_quickfix_window_is_the_last
au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction
" }}}

" Key Mapping: {{{

" http://vim.wikia.com/wiki/Map_semicolon_to_colon
" map ; :

map Q <Nop>

"" function keys
nmap <F2>  :set nonumber!<CR>
nmap <F3>  :set nopaste!<CR>
nmap <F4>  :set spell!<CR>
" Leave F5 for ctrlp
nmap <F6>  :set wrap!<CR>
nmap <F7>  :QFix<CR>
nmap <F8>  :UndotreeToggle<CR>
nmap <F12> :tab ball<CR>
" F12 > JSLint

"" tab to indent
nmap <tab> V>
vmap <tab> >gv
nmap <s-tab> V<
vmap <s-tab> <gv

"" HOME END
nmap <C-Home> gg
nmap <C-End> G<End>
imap <C-Home> <Esc>ggi
imap <C-End> <Esc>G<End>i

"" up/down base on screen
"noremap  <C-J>       gj
"noremap  <C-K>       gk
"noremap  <Down>      gj
"noremap  <Up>        gk
"inoremap <Down> <C-O>gj
"inoremap <Up>   <C-O>gk

"" Fix up/down in popup
" inoremap <silent><expr><Up> pumvisible() ? "<Up>" : "<C-O>gk"
" inoremap <silent><expr><Down> pumvisible() ? "<Down>" : "<C-O>gj"
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"" tab control
"" http://c9s.blogspot.com/2007/08/vim-my-key-mapping-for-tabs.html
nmap    <leader>tn    :tabnew<cr>
nmap    <leader>te    :tabedit
nmap    <leader>tx    :tabedit .<cr>
nmap    <leader>th    :tab help<cr>

" nmap    <C-t>     :tabnew<cr>
" nmap    <C-w>     :tabc<cr>

nmap    <C-left>  :tabp<cr>
nmap    <C-right> :tabn<cr>

imap    <C-j>  <ESC>:tabn<CR>
nmap    <C-j>  :tabn<CR>
imap    <C-k>  <ESC>:tabp<CR>
nmap    <C-k>  :tabp<CR>

cmap w!! %!sudo tee > /dev/null %

"" keypad
"" http://vim.wikia.com/wiki/PuTTY_numeric_keypad_mappings
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OQ /
imap <Esc>OR *
imap <Esc>Ol +
imap <Esc>OS -

" ctags
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

let NERDMapleader='<Leader>c'

" switch
nnoremap <leader>- :Switch<cr>
"}}}

" Airline: {{{

let g:airline_left_sep = ''
" let g:airline_right_sep = ''
let g:airline_fugitive_prefix = '  '
let g:airline_readonly_symbol = ''
" let g:airline_linecolumn_prefix = ' '

let g:airline_theme='jellybeans'

" }}}

" SyntaxRange {{{

autocmd FileType html call SyntaxRange#Include('/<script[^>]*>/', '</script>', 'javascript', 'htmlTagName')
autocmd FileType html call SyntaxRange#Include('/<style[^>]*>/', '</style>', 'css', 'htmlTagName')

" }}}

" Emmet: {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}

" YankStack: {{{
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

" Syntastic: {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_jslint_conf = "--nomen --plusplus --forin --regexp"
" let g:syntastic_coffee_coffeelint_args = "--csv -f ~/coffeelint-config.json"
let g:syntastic_html_checkers = []
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" NERDCommenter: {{{
let NERDSpaceDelims = 1
" }}}

" NERDTree: {{{
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" SpellBad Highlight: {{{
highlight SpellBad   ctermbg=124
" }}}

" HTML: {{{
"" HTML Tag Escape:
""  http://vim.wikia.com/wiki/Escape_and_unescape_HTML_entities
function HtmlEscape()
    silent s/&/\&amp;/eg
    silent s/</\&lt;/eg
    silent s/>/\&gt;/eg
    silent s/"/\&quot;/eg
endfunction

function HtmlUnEscape()
    silent s/&lt;/</eg
    silent s/&gt;/>/eg
    silent s/&amp;/\&/eg
    silent s/&quot;/"/eg
endfunction

function HtmlReIndent()
    silent %s/\(<\/\w\+\)>\s\?</\1>
</eg
    normal gg=G
endfunction
"map <silent> <c-h> :call HtmlEscape()<CR>
"map <silent> <c-u> :call HtmlUnEscape()<CR>

"" HTML omni
let b:html_omni_flavor = 'html5'
" }}}

" CoffeeTags: {{{
if executable('coffeetags')
    let g:tagbar_type_coffee = {
            \ 'ctagsbin' : 'coffeetags',
            \ 'ctagsargs' : '',
            \ 'kinds' : [
            \ 'f:functions',
            \ 'o:object',
            \ ],
            \ 'sro' : ".",
            \ 'kind2scope' : {
            \ 'f' : 'object',
            \ 'o' : 'object',
            \ }
            \ }
endif
" }}}

" ctrlp: {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_show_hidden = 0
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules$\|\.git$\|\.meteor$\|\.svn$\|dist$\|\.hg$',
  \ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\.gif$\|\.svg$'
  \ }

" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" }}}

" Command Mapping: {{{
com! -bang W :w
com! -bang Wq :wq
com! -bang Wqa :wqa
com! -bang WQ :wq
com! -bang WQa :wqa
com! -bang WQA :wqa
com! -bang Q :q
com! -bang Qa :qa
" }}}

" Macros: {{{
runtime macros/matchit.vim
" }}}

" Switch: {{{
let g:switch_custom_definitions =
    \ [
    \   ['true', 'false'],
    \   ['and', 'or'],
    \   ['is', 'isnt'],
    \   ['w', 'h'],
    \   ['width', 'height'],
    \   {
    \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
    \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
    \     '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
    \     '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
    \     '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
    \   }
    \ ]
" }}}

" Tern.js: {{{
"" Jump to the definition of the thing under the cursor.
map <leader>d :TernDef
"" Show all references to the variable or property under the cursor.
map <leader>r :TernRefs
"" Rename the variable under the cursor.
map <leader>rn :TernRename
"  }}}

" Cosco: {{{
command! CommaOrSemiColon call cosco#commaOrSemiColon()
autocmd FileType javascript,css noremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>
"  }}}

" Easymotion: {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
map <Leader>s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Neeb one more keystroke, but on average, it may be more comfortable.
map <Leader>ss <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}

" JShint2: {{{
let jshint2_read = 1
let jshint2_save = 1
let jshint2_confirm = 0
let jshint2_error = 1
" }}}

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" After Loading All Plugin: {{{
function AfterStart ()

" plugin commands
"" Align
if exists(":Align")
    com! -bang -range -nargs=* A <line1>,<line2>call Align#Align(<bang>0,<q-args>)
endif

"" eregex
if exists(":M")
    nnoremap <leader>/ :call eregex#toggle()<CR>
endif

if exists(":NERDTreeToggle")
    map <F12> :NERDTreeToggle<CR>
endif

"" Speeddating.vim
if exists(":SpeedDatingFormat")
    SpeedDatingFormat %H:%M
    SpeedDatingFormat %m/%d
    SpeedDatingFormat %Y/%m/%d%[ T_-]%H:%M:%S%?[Z]
endif

" Fix for vim-snipmate
nmap <tab> V>
vmap <tab> >gv

" yankstack
nmap Y y$

endfunction
autocmd VimEnter * :call AfterStart()
" }}}

map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" comment
map <Leader><Leader>c <Leader>c<space>

" remove tailing whitespace;
autocmd BufWritePre * :%s/\s\+$//e

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" Resize split window
nmap + <C-W>+
nmap - <C-W>-

" Resize vsplit window
nmap <Right> <C-w>>
nmap <Left> <C-w><

" quick open vimrc in a new tab
nmap <leader>v :tabe $MYVIMRC<CR>

" hit enter to cancel searched highlight
noremap <CR> :nohlsearch<CR>
