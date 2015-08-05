" .vimrc by othree ( othree AT gmail DOT com )

" Vundle
" git clone http://github.com/gmarik/vundle.git ~/.nvim/bundle/vundle

filetype off                   " required!

set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Colors scheme
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'chriskempson/base16-vim'

" Status line
" Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-airline'

" Improve
Plugin 'VisIncr'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'junegunn/vim-easy-align'
" Plugin 'othree/eregex.vim'
" Plugin 'kien/ctrlp.vim'
" Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'AndrewRadev/switch.vim'
Plugin 'terryma/vim-expand-region'
" Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/MatchTag'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'justincampbell/vim-eighties'
Plugin 'tpope/vim-dispatch'
Plugin 'blueyed/vim-diminactive'

" Unite
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tacroe/unite-mark'
Plugin 'h1mesuke/unite-outline'
Plugin 'Shougo/neomru.vim'
Plugin 'rstacruz/vim-fastunite'

" Complete
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'othree/jspc.vim'
Plugin 'tpope/vim-endwise'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'jiangmiao/auto-pairs'

Plugin 'Lokatog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

" Filetype
Plugin 'othree/html5.vim'
Plugin 'othree/xml.vim'

" JavaScript
Plugin 'elzr/vim-json'
Plugin 'othree/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'moll/vim-node'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

Plugin 'nginx.vim'

" CSS, SCSS
Plugin 'hail2u/vim-css3-syntax'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'cakebaker/scss-syntax.vim'

" Markdown
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
let base16colorspace=256
colorscheme base16-material
hi clear SignColumn
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
" set backspace=indent,eol,start whichwrap+=<,>,[,]
set backspace=indent,eol,start
set hidden
set nobomb
set hlsearch
set nobackup
" set backupcopy=yes
set noswapfile
set textwidth=80
set noshowmode
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=200                                             "Reduce Command timeout for faster escape and O
" set lazyredraw                                                                  "Do not redraw on registers and macros
set splitright                                                                  "Set up new splits positions
set autoread
"Disable preview for autocomplete
set completeopt-=preview
set fileformats+=mac
set sessionoptions-=options
set showcmd
set wildmenu
set nrformats-=octal
set incsearch
set confirm
" Smart case search if there is uppercase
set smartcase
set ignorecase


" set guicolors
" set guifont=inconsolata\ for\ powerline\ 12                                     "font setup
" let g:hybrid_use_xresources = 1
let g:enable_bold_font = 1

let mapleader = ","

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,big5
set ambiwidth=double
set t_Co=256

" Status Line
set laststatus=2
" set statusline=%f\ %y%r%1*%m%*\ %{g:HahHah()}%=%<\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ %4c\ %4l\ [%P]
" set statusline=%=%{g:HahHah()}

" Special File Types
au BufRead,BufNewFile *nginx* set ft=nginx
au BufRead,BufNewFile *.vroom set ft=vroom
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.tpl set ft=html
au BufRead,BufNewFile *.xsl set ft=html
au BufRead,BufNewFile *.json set syntax=json
au BufRead,BufNewFile *.n3  set ft=n3
au BufRead,BufNewFile .eslintrc set syntax=json
au BufRead,BufNewFile .jshintrc set syntax=json
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
set gcr=a:blinkon500-blinkwait500-blinkoff500

" highlight the 80th column
"
" In Vim >= 7.3, also highlight columns 120+
if exists('+colorcolumn')
  " (I picked 120-320 because you have to provide an upper bound and 500 seems
  " to be enough.)
  " let &colorcolumn="80,".join(range(120,500),",")
  set colorcolumn=80
else
  " fallback for Vim < v7.3
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Color Tweak for highlight
" highlight CursorLine    ctermbg=89
" highlight Comment       ctermfg=246
" highlight ColorColumn   ctermbg=235 guibg=#2c2d27

" }}}

" FileType: {{{
"" omnifunc setting
setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
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
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_autoclose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '                                "Set up spacing for sidebar icons
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <leader>nt :NERDTreeToggle<cr>
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
nmap <F4>  :set spell!<CR>
" Leave F5 for ctrlp
nmap <F6>  :set wrap!<CR>
nmap <F7>  :QFix<CR>
nmap <F12> :tab ball<CR>

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

"" tab control
"" http://c9s.blogspot.com/2007/08/vim-my-key-mapping-for-tabs.html
nmap    <leader>tn    :tabnew<cr>
nmap    <leader>te    :tabedit
nmap    <leader>tx    :tabedit .<cr>
nmap    <leader>th    :tab help<cr>

cmap w!! %!sudo tee > /dev/null %

" ctags
" nnoremap <leader>. :CtrlPTag<cr>
" nnoremap <silent> <Leader>b :TagbarToggle<CR>

"}}}

" Airline: {{{
let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
let g:airline_theme = "hybrid"                                                  "Set theme to powerline default theme
let g:airline_section_y = '%{(&fenc == "" ? &enc : &fenc)}'                     "set encoding type info
let g:airline_section_z = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline
"}}}

" Emmet: {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}

" UltiSnips: {{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}

" Syntastic: {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "x"
let g:syntastic_style_error_symbol = "x"
let g:syntastic_warning_symbol = "▵"
let g:syntastic_style_warning_symbol = "▵"
let g:syntastic_loc_list_height = 5                                             "Height of the errors window
let g:syntastic_always_populate_loc_list = 1                                    "Always popuplate syntastic error list
let g:syntastic_aggregate_errors = 1                                            "Show errors from all checkers
" let g:syntastic_auto_jump = 3                                                   "Jump to first error detected
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']                        "Enable only basic syntax checking for php
let g:syntastic_javascript_checkers = ['jscs']                        "Enable these linters for js
let g:syntastic_scss_checkers = []                                              "Disable scss checking
let g:airline#extensions#syntastic#enabled = 1
" }}}

" Gitgutter: {{{
let g:gitgutter_realtime = 0                                                    "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                                       "Disable gitgutter to eager load on tab or buffer switch
" }}}

" NERDCommenter: {{{
let NERDMapleader='<Leader>c'
let NERDSpaceDelims = 1
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

" Switch: {{{
nnoremap <leader>- :Switch<cr>
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

" Unite: {{{
map  <C-p>     [unite]p
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" }}}

" Ctrlp: {{{
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" let g:ctrlp_show_hidden = 0
" let g:ctrlp_working_path_mode = 'ra'

" set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" let g:ctrlp_custom_ignore = {
  " \ 'dir':  'node_modules$\|\.git$\|\.meteor$\|\.svn$\|dist$\|\.hg$',
  " \ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\.gif$\|\.svg$'
  " \ }

" " let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      " \ --ignore .git
      " \ --ignore .svn
      " \ --ignore .hg
      " \ --ignore .DS_Store
      " \ --ignore node_modules
      " \ --ignore "**/*.pyc"
      " \ -g ""'

" let g:ctrlp_prompt_mappings = {
  " \ 'AcceptSelection("e")': [],
  " \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  " \ }
" }}}

" Tern.js: {{{
"" Jump to the definition of the thing under the cursor.
map <leader>d :TernDef
"" Show all references to the variable or property under the cursor.
map <leader>r :TernRefs
"" Rename the variable under the cursor.
map <leader>rn :TernRename
"  }}}

" Vim JSON: {{{
let g:vim_json_syntax_conceal = 0                                               "Disable setting quotes for json syntax
"  }}}

" Diminactive: {{{
" Dim inactive windows
autocmd VimEnter * DimInactive
"  }}}

" vim-node: {{{
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
"  }}}

" fugitive.vim: {{{
nmap <leader>gs :Gstatus<cr>
nmap <leader>gp :Dispatch git push<cr>
"  }}}

" vim-eighties: {{{
let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
let g:eighties_extra_width = 5 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
let g:eighties_bufname_additional_patterns = ['fugitiveblame', 'NERDTree'] " Defaults to [], 'fugitiveblame' is only an example. Takes a comma delimited list of bufnames as strings.
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

" vim-startify: {{{
" let g:startify_custom_header = [
" \ '                                                ',
" \ '                       _oo0oo_                  ',
" \ '                      o8888888o                 ',
" \ '                      88" . "88                 ',
" \ '                      (| -_- |)                 ',
" \ '                      0\  =  /0                 ',
" \ '                    ___/`---`\___               ',
" \ '                  .` \\|     |// `.             ',
" \ '                 / \\|||  :  |||// \            ',
" \ '                / _||||| -:- |||||- \           ',
" \ '               |   | \\\  -  /// |   |          ',
" \ '               | \_|  ``\---/``  |_/ |          ',
" \ '               \  .-\__  `-`  ___/-. /          ',
" \ '             ___`. .`  /--.--\  `. .`___        ',
" \ '          ."" `<  `.___\_<|>_/___.` >` "".      ',
" \ '         | | :  `- \`.;`\ _ /`;.`/ - ` : | |    ',
" \ '         \  \ `_.   \_ __\ /__ _/   .-` /  /    ',
" \ '     =====`-.____`.___ \_____/___.-`___.-`===== ',
" \ '                       `=---=`                  ',
" \ '                                                ',
" \ '                                                ',
" \ '     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~',
" \ '                                                ',
" \ '               佛祖保佑         永無BUG         ',
" \ '',
" \]
" }}}

" YankStack: {{{
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

" vim-easy-align: {{{
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

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

endfunction
autocmd VimEnter * :call AfterStart()
" }}}

" map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      " \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      " \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

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

" Don't override register when pasting
function! RestoreRegister()
    let @" = s:restore_reg
    if &clipboard == "unnamed"
        let @* = s:restore_reg
    endif
    return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()
