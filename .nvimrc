
" Plugin List: {{{
call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

" Unite
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
" Plug 'Shougo/unite.vim'
" Plug 'tacroe/unite-mark'
" Plug 'ujihisa/unite-colorscheme'
" Plug 'h1mesuke/unite-outline'
" Plug 'Shougo/neomru.vim'
" Plug 'rstacruz/vim-fastunite'
" Plug 'Shougo/vimfiler.vim' | Plug 'ryanoasis/vim-devicons'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File explore
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  | Plug 'ryanoasis/vim-devicons'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Git
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'

" junegunn plugins
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-emoji'

" Completion
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } | Plug 'Konfekt/FastFold' " Dark powered asynchronous completion framework for neovim
Plug 'Shougo/neoinclude.vim'
" Plug 'ujihisa/neco-look', { 'for': ['markdown', 'text', 'html'] } " A neocomplcache plugin for English, using look command
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'

" Snippets
Plug 'Shougo/neosnippet.vim' " neo-snippet plugin contains neocomplcache snippets source
Plug 'Shougo/neosnippet-snippets' " The standard snippets repository for neosnippet
Plug 'honza/vim-snippets' " vim-snipmate default snippets
Plug 'matthewsimo/angular-vim-snippets' " repo for UltiSnips & Snipmate for angular to be included as a submodule for use in your .vim directory

" Status line
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline

" Utilities
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'powerman/vim-plugin-AnsiEsc' " ansi escape sequences concealed, but highlighted as specified (conceal)
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'terryma/vim-multiple-cursors'
Plug 'maxbrunsfeld/vim-yankstack' " A lightweight implementation of emacs's kill-ring for vim
Plug 'ConradIrwin/vim-bracketed-paste' " Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'itmammoth/doorboy.vim' " Vim plugin for auto closing brackets ( => (|) and quotations \" => \"|\" , and more
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'vim-scripts/matchit.zip' " extended % matching

" language-specific plugins
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'valloric/MatchTagAlways', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'othree/javascript-libraries-syntax.vim' " JavaScript support
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'othree/jsdoc-syntax.vim', {'for':['javascript', 'typescript']}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug '1995eaton/vim-better-javascript-completion', {'for': 'javascript'} " An expansion of Vim's current JavaScript syntax file.
Plug 'dhruvasagar/vim-table-mode' " VIM Table Mode for instant table creation.
Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'} " TypeScript syntax plugin
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'tmhedberg/SimpylFold', { 'for': 'python' } " markdown support
Plug 'docker/docker', { 'rtp': 'contrib/syntax/vim' }
Plug 'tmux-plugins/vim-tmux'
Plug 'stephpy/vim-yaml', { 'for': ['yml', 'yaml'] }

" All of your Plugins must be added before the following line
call plug#end()
" }}}

" Abbreviations: {{{
abbr funciton function
abbr tempalte template
" }}}

" Basic Settings: {{{
filetype plugin indent on    " required
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let mapleader = ","
set background=dark
" execute "set background=".$BACKGROUND
colorscheme OceanicNext
" execute "colorscheme ".$THEME
set conceallevel=0
" not compatible with vi
set nocompatible
set noswapfile
set nobackup
set textwidth=120
" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
" faster redrawing
set ttyfast
set lazyredraw
" code folding settings
set foldmethod=syntax " fold based on syntax
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=99
function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
set wildmenu " enhanced command line completion
set wildmode=full
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for airline
set confirm
set complete=.,w,b,u,t,k " http://usevim.com/2015/06/03/spelling-tips/
" set completeopt+=noselect,menu,preview
set completeopt-=preview
set title " set terminal title
" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set magic " Set magic on, for regex
" Remove the one-second escape key delay
" http://stackoverflow.com/questions/12312178/tmux-and-vim-escape-key-being-seen-as-and-having-long-delay
set timeout timeoutlen=1000 ttimeoutlen=100
set showmatch " show matching braces
" No annoying sound on errors
set belloff=all
set fileencodings=utf-8
set ambiwidth=double
set relativenumber number " show line numbers
set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set autoindent " automatically set indent of new line
set smartindent
set showbreak=↪
set undodir=~/.config/nvim/undodir
set undofile

if !has('nvim')
  set encoding=utf-8
endif
if has('mouse')
  set mouse=a
endif

" highlight conflicts
set laststatus=2 " show the satus line all the time
set display+=lastline

highlight TermCursor ctermfg=red guifg=red
" }}}

" Section Mappings {{{

" wipout buffer
nmap <silent> <leader>b :bw<cr>

" disable Ex mode
noremap Q <NOP>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" toggle invisible characters
" set invlist
" set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" make the highlighting of tabs less annoying
" highlight SpecialKey ctermbg=none
" nmap <leader>l :set list!<cr>

" tab to indent
nmap <tab> V>
vmap <tab> >gv
nmap <s-tab> V<
vmap <s-tab> <gv

" tab control
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit
nmap <leader>tx :tabedit .<cr>
nmap <leader>th :tab help<cr>
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" switch between current and last buffer
nmap <leader>. <c-^>

" Terminal settings
tnoremap <leader><ESC> <C-\><C-n>

map <leader>wc :wincmd q<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" moving in line
noremap H ^
noremap L g_

" this is the best, let me tell you why
" how annoying is that everytime you want to do something in vim
" you have to do shift-; to get :, can't we just do ;?
" Plus what does ; do anyways??
" if you do have a plugin that needs ;, you can just wap the mapping
" nnoremap : ;
" give it a try and you will like it
nnoremap ; :

inoremap <c-f> <c-x><c-f>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Resize split window
nmap + <C-W>+
nmap - <C-W>-

" quick open vimrc in a new tab
nmap <leader>v :tabe $MYVIMRC<CR>

" hit enter to cancel searched highlight
noremap <CR> :nohlsearch<CR>

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

" Section AutoGroups {{{
" file type specific settings
augroup configgroup
  autocmd!
  autocmd FileType vim setlocal ts=2 sw=2 sts=2 fdc=1 foldmethod=marker foldlevel=0
  autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType jade setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 completefunc=emoji#complete wrap spell
  autocmd FileType .xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
  autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
  autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}
  autocmd FileType coffee setl foldmethod=indent

  " automatically resize panes on resize
  autocmd VimResized * exe 'normal! \<c-w>='

  autocmd BufNewFile,BufRead *.ejs set filetype=html
  autocmd BufNewFile,BufRead *.ino set filetype=c
  autocmd BufNewFile,BufRead *.svg set filetype=xml
  autocmd BufNewFile,BufRead .babelrc set filetype=json
  autocmd BufNewFile,BufRead .jshintrc set filetype=json
  autocmd BufNewFile,BufRead .eslintrc set filetype=json
  autocmd BufNewFile,BufRead *.es6 set filetype=javascript
  autocmd BufNewFile,BufRead *.[Dd]ockerfile,Dockerfile.* set filetype=dockerfile

  " make quickfix windows take all the lower section of the screen
  " when there are multiple windows open
  autocmd FileType qf wincmd J

  " turn on spelling for markdown files
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell filetype=markdown
  " highlight bad words in red
  autocmd BufRead,BufNewFile *.md hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

  " Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
  " center buffer around cursor when opening files
  autocmd BufRead * normal zz

  " TypeScript hint
  autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
augroup END
" }}}

" Plugins setting {{{

" ctrlsf.vim: {{{

let g:ctrlsf_confirm_save=0

" }}}

" NERDTree: {{{

let g:NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDTreeWinPos='right'
let NERDTreeIgnore = ['\.js.map$']
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
nmap <leader>nt :NERDTreeToggle<cr>
autocmd vimenter * NERDTree
augroup nerd_loader
  autocmd!
  " autocmd BufEnter * :redraw!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

" }}}

" deoplete-ternjs: {{{
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete
" }}}

" indentLine: {{{
let g:indentLine_enabled = 1
" }}}

" VimFiler: {{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_tree_opened_icon = "▼"
" let g:vimfiler_tree_closed_icon = "▷"
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_ignore_pattern= ['.DS_Store']
let g:vimfiler_ignore_filters = ['']
" nmap <leader>nt :VimFiler -toggle<cr>
" Open filer in project folder.
" nnoremap <leader>nt :VimFiler -toggle -quit<cr>
nnoremap [unite]e :VimFilerBufferDir -toggle -quit<cr>
" }}}

" Emmet: {{{
let g:user_emmet_complete_tag = 1
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}

" neosnippet: {{{
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/neosnippet-snippets/neosnippets, ~/.config/nvim/plugged/angular-vim-snippets/snippets'

" <CR> close popup and save indent or expand snippet
function! CleverCr()
    if pumvisible()
        if neosnippet#expandable()
            let exp = "\<Plug>(neosnippet_expand)"
            return exp . neocomplete#smart_close_popup()
        else
            return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        endif
    else
        return "\<CR>"
    endif
endfunction
" <CR> close popup and save indent or expand snippet
imap <expr> <CR> CleverCr()
" Tab completion (shift Tab for going backwards) for Neocomplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" <Down> and <Up> cycle like <Tab> and <S-Tab>
inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
" <ESC> takes you out of insert mode and also gets rid of suggestions window
inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" }}}

" vim-emoji: {{{

" %< Where to truncate
" %n buffer number
" %F Full path
" %m Modified flag: [+], [-]
" %r Readonly flag: [RO]
" %y Type:          [vim]
" fugitive#statusline()
" %= Separator
" %-14.(...)
" %l Line
" %c Column
" %V Virtual column
" %P Percentage
" %#HighlightGroup#
set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P
silent! if emoji#available()
  let s:ft_emoji = map({
    \ 'c':          'baby_chick',
    \ 'clojure':    'lollipop',
    \ 'coffee':     'coffee',
    \ 'cpp':        'chicken',
    \ 'css':        'art',
    \ 'eruby':      'ring',
    \ 'gitcommit':  'soon',
    \ 'haml':       'hammer',
    \ 'help':       'angel',
    \ 'html':       'herb',
    \ 'java':       'older_man',
    \ 'javascript': 'monkey',
    \ 'make':       'seedling',
    \ 'markdown':   'book',
    \ 'perl':       'camel',
    \ 'python':     'snake',
    \ 'ruby':       'gem',
    \ 'scala':      'barber',
    \ 'sh':         'shell',
    \ 'slim':       'dancer',
    \ 'text':       'books',
    \ 'vim':        'poop',
    \ 'vim-plug':   'electric_plug',
    \ 'yaml':       'yum',
    \ 'yaml.jinja': 'yum'
  \ }, 'emoji#for(v:val)')

  function! S_filetype()
    if empty(&filetype)
      return emoji#for('grey_question')
    else
      return get(s:ft_emoji, &filetype, '['.&filetype.']')
    endif
  endfunction

  function! S_modified()
    if &modified
      return emoji#for('kiss').' '
    elseif !&modifiable
      return emoji#for('construction').' '
    else
      return ''
    endif
  endfunction

  function! S_fugitive()
    if !exists('g:loaded_fugitive')
      return ''
    endif
    let head = fugitive#head()
    if empty(head)
      return ''
    else
      return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
    endif
  endfunction

  let s:braille = split('"⠉⠒⠤⣀', '\zs')
  function! Braille()
    let len = len(s:braille)
    let [cur, max] = [line('.'), line('$')]
    let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
    return s:braille[pos]
  endfunction

  hi def link User1 TablineFill
  let s:cherry = emoji#for('cherry_blossom')
  function! MyStatusLine()
    let mod = '%{S_modified()}'
    let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
    let ft  = '%{S_filetype()}'
    let fug = ' %{S_fugitive()}'
    let sep = ' %= '
    let pos = ' %l,%c%V '
    let pct = ' %P '

    return s:cherry.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:cherry
  endfunction

  " Note that the "%!" expression is evaluated in the context of the
  " current window and buffer, while %{} items are evaluated in the
  " context of the window that the statusline belongs to.
  set statusline=%!MyStatusLine()
endif

" ----------------------------------------------------------------------------
" vim-emoji :dog: :cat: :rabbit:!
" ----------------------------------------------------------------------------
function! s:replace_emojis() range
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let subs = substitute(line,
          \ ':\([^:]\+\):', '\=emoji#for(submatch(1), submatch(0))', 'g')
    if line != subs
      call setline(lnum, subs)
    endif
  endfor
endfunction
command! -range EmojiReplace <line1>,<line2>call s:replace_emojis()

" }}}


" vim-fugitive: {{{

nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
au FileType gitcommit nnoremap <buffer> <silent> cA :<C-U>Gcommit --amend --date="$(date)"<CR>

" }}}

" Typescript & Javscript omni complete: {{{
let g:tsuquyomi_disable_quickfix = 1
let g:vimjs#casesensistive = 1
let g:vimjs#smartcomplete = 1
let g:tsuquyomi_disable_quickfix = 1
" }}}

" Multi Cursor: {{{
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}

" AutoFormat: {{{
" ,f to format code, requires formatters: read the docs
noremap <leader>f :Autoformat<CR>
" Autoformat triggered when ; } is typed.
imap } }<ESC>:Autoformat<CR>/}<CR>:let @/ = ""<CR>i<RIGHT>
" }}}

" vim-table: {{{
let g:table_mode_corner="|"
noremap <leader>TM :TableModeToggle<CR>
" }}}

" FastFold: {{{
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
" }}}

" Deoplete.nvim: {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always=1
" }}}

" Neomake: {{{
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_verbose=0
let g:neomake_open_list=2
let g:neomake_list_height=10
let g:neomake_warning_sign = {
      \ 'text': '✹',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '✖',
      \ 'texthl': 'ErrorMsg',
      \ }

let g:neomake_javascript_eslint_maker = {
    \ 'args': ['--no-color', '--format', 'compact', '--config', '~/eslintrc'],
    \ 'errorformat': '%f: line %l\, col %c\, %m'
    \ }
" function! neomake#makers#ft#javascript#eslint()
" 		return {
" 				\ 'args': ['-f', 'compact'],
" 				\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
" 				\ '%W%f: line %l\, col %c\, Warning - %m'
" 				\ }
" endfunction
" autocmd! BufWritePost * Neomake
autocmd FileType javascript :call NeomakeESlintChecker()
au! BufEnter *.js call EnterNeomake()
au! BufWritePost *.js call SaveNeomake()
function! EnterNeomake()
  " don't show the loc-list when entering a buffer
  let g:neomake_open_list=0
  exe "Neomake eslint"
endfunction

function! SaveNeomake()
  " show the loc-list after saving
  let g:neomake_open_list=2
  exe "Neomake eslint"
endfunction

function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm-which')
    let l:eslint = split(system('npm-which eslint'))[0]
    return 0
  endif

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction

nmap <Leader>lo :lopen<CR>      " open location window
nmap <Leader>lc :lclose<CR>     " close location window
nmap <Leader>ll :ll<CR>         " go to current error/warning
nmap <Leader>ln :lnext<CR>      " next error/warning
nmap <Leader>lp :lprev<CR>      " previous error/warning
"}}}

" Airline: {{{
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
" let g:airline_theme='base16'
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_left_sep=''
let g:airline_right_sep=''
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
"}}}

" Markdown: {{{
" no need to fold things in markdown all the time
let g:vim_markdown_folding_disabled = 1
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
" disable markdown auto-preview. Gets annoying
let g:instant_markdown_autostart = 0
nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
"  }}}

if executable('fzf')
  " FZF {{{
  if has('nvim')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
  endif

  let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
  let g:fzf_nvim_statusline = 0
  " <C-p> or <C-t> to search files
  nnoremap <silent> <C-t> :FZF -m<cr>
  nnoremap <silent> <C-p> :FZF -m<cr>

  nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
  nnoremap <silent> <Leader>AG :Ag <C-R><C-A><CR>

  " <M-p> for open buffers
  nnoremap <silent> <M-p> :Buffers<cr>

  " <M-S-p> for MRU
  nnoremap <silent> <M-S-p> :History<cr>

  " Use fuzzy completion relative filepaths across directory
  imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
  imap <c-x><c-k> <plug>(fzf-complete-word)
  " imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Customize fzf colors to match your color scheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  command! Plugs call fzf#run({
    \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
    \ 'options': '--delimiter / --nth -1',
    \ 'down':    '~40%',
    \ 'sink':    'Explore'})

  " Better command history with q:
  command! CmdHist call fzf#vim#command_history({'right': '40'})
  nnoremap q: :CmdHist<CR>

  " Better search history
  command! QHist call fzf#vim#search_history({'right': '40'})
  nnoremap q/ :QHist<CR>

  autocmd! FileType fzf tnoremap <buffer> <leader>q <c-c>

    " Close preview window
  if exists('##CompleteDone')
    au CompleteDone * pclose
  else
    au InsertLeave * if !pumvisible() && (!exists('*getcmdwintype') || empty(getcmdwintype())) | pclose | endif
  endif

  if executable('ag')
    let &grepprg = 'ag --nogroup --nocolor --column --follow --hidden --ignore .git'
  else
    let &grepprg = 'grep -rn $* *'
  endif
  command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen
  " }}}
else
  " Unite: {{{
  let g:unite_data_directory='~/.nvim/.cache/unite'
  let g:unite_source_history_yank_enable=1
  let g:unite_prompt='» '
  let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']
  " call unite#filters#matcher_default#use(['matcher_fuzzy'])
  " call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#custom#source('file_rec,file_rec/async', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
  nnoremap <silent> <leader>g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
  nnoremap <silent> <leader>r  :<C-u>UniteResume search-buffer<CR>
  nnoremap <silent> <c-p> :Unite -auto-resize -start-insert file_rec/async<CR>
  " }}}
end

" Vim JSON: {{{
" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0
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

" YankStack: {{{
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

" Navigate between vim buffers and tmux panels ------------------------------{{{
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>
"}}}

" }}}
