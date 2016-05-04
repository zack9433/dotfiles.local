
" Section General {{{
" Abbreviations
abbr funciton function
abbr tempalte template

let mapleader = ","
let g:mapleader = ','

filetype on
set conceallevel=0
" not compatible with vi
set nocompatible
set noswapfile
set nobackup
" detect when a file is changed
set autoread
" make backspace behave in a sane manner
set backspace=indent,eol,start
" set a map leader for more key combos
set showtabline=2 " always show tab line
set textwidth=120
" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set fileformats+=mac
set sessionoptions-=options

if has('mouse')
  set mouse=a
endif
" faster redrawing
set ttyfast

set diffopt+=vertical
" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
set laststatus=2 " show the satus line all the time
set display+=lastline
" }}}

" Section Functions {{{

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

fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown\|perl'
        return
    endif
    %s/\s\+$//e
endfun

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

nnoremap <silent> <leader>u :call HtmlUnEscape()<cr>


" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor

" }}}

" Section Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'chriskempson/base16-vim'

" Unite
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'Shougo/unite.vim'
Plug 'tacroe/unite-mark'
Plug 'ujihisa/unite-colorscheme'
Plug 'h1mesuke/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'rstacruz/vim-fastunite'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } | Plug 'Konfekt/FastFold' " Dark powered asynchronous completion framework for neovim
Plug 'Shougo/neoinclude.vim'
Plug 'ujihisa/neco-look' " A neocomplcache plugin for English, using look command
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'rhysd/github-complete.vim' " Vim input completion for GitHub

" Snippets
Plug 'Shougo/neosnippet.vim' " neo-snippet plugin contains neocomplcache snippets source
Plug 'Shougo/neosnippet-snippets' " The standard snippets repository for neosnippet
Plug 'honza/vim-snippets' " vim-snipmate default snippets

" utilities
Plug 'neilagabriel/vim-geeknote' " Vim plugin for Geeknote
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'Chiel92/vim-autoformat'
Plug 'mhinz/vim-sayonara' " Sane buffer/window deletion.
Plug 'mattn/webapi-vim' " vim interface to Web API
Plug 'terryma/vim-multiple-cursors'
Plug 'rking/ag.vim'
Plug 'maxbrunsfeld/vim-yankstack' " A lightweight implementation of emacs's kill-ring for vim
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'AndrewRadev/switch.vim' " A simple Vim plugin to switch segments of text with predefined replacements
Plug 'terryma/vim-expand-region' " Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
Plug 'ConradIrwin/vim-bracketed-paste' " Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-endwise' " automatically add end in ruby
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'" asynchronous build and test dispatcher
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free writing

" language-specific plugins
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'valloric/MatchTagAlways', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'othree/jsdoc-syntax.vim', {'for':['javascript', 'typescript']}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug '1995eaton/vim-better-javascript-completion', {'for': 'javascript'} " An expansion of Vim's current JavaScript syntax file.
Plug 'dhruvasagar/vim-table-mode' " VIM Table Mode for instant table creation.
Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'} " TypeScript syntax plugin
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
Plug 'digitaltoad/vim-jade', { 'for': 'jade' } " jade support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

" }}}

" Geeknote: {{{
let g:GeeknoteFormat="markdown"
noremap <F8> :Geeknote<cr>
"  }}}

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
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets, ~/Github/ionic-snippets, ~/.vim/bundle/angular-vim-snippets/snippets'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

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

" NERDTree: {{{
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
" let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore = ['\.js.map$']
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
nmap <leader>nt :NERDTreeToggle<cr>
" }}}

" github-completion: {{{
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.markdown = ''
let g:neocomplete#sources#omni#input_patterns.gitcommit = ''
" Disable overwriting 'omnifunc'
" let g:github_complete_enable_omni_completion = 0
" autocmd FileType markdown,gitcommit
"     \ imap <C-x><C-x> <Plug>(github-complete-manual-completion)
" }}}

" Deoplete.nvim: {{{
let g:deoplete#enable_at_startup = 1
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

" Fugitive.vim: {{{
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>
"  }}}

" Neomake -------------------------------------------------------------------{{{
  function! neomake#makers#ft#javascript#eslint()
      return {
          \ 'args': ['-f', 'compact'],
          \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
          \ '%W%f: line %l\, col %c\, Warning - %m'
          \ }
  endfunction
  let g:neomake_javascript_enabled_makers = ['eslint']
  autocmd! BufWritePost * Neomake
"}}}

" Airline: {{{
let g:airline_powerline_fonts=1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_left_sep=''
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

" Unite: {{{
let g:unite_data_directory='~/.nvim/.cache/unite'
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <silent> <c-p> :Unite -auto-resize -start-insert file_rec/async<CR>
" }}}

" Git from unite...ERMERGERD ------------------------------------------------{{{
let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
let g:unite_source_menu_menus.git = {
  \ 'description' : 'Fugitive interface',
  \}
let g:unite_source_menu_menus.git.command_candidates = [
  \[' git status', 'Gstatus'],
  \[' git diff', 'Gvdiff'],
  \[' git commit', 'Gcommit'],
  \[' git stage/add', 'Gwrite'],
  \[' git checkout', 'Gread'],
  \[' git rm', 'Gremove'],
  \[' git cd', 'Gcd'],
  \[' git push', 'exe "Git! push " input("remote/branch: ")'],
  \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
  \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
  \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
  \[' git fetch', 'Gfetch'],
  \[' git merge', 'Gmerge'],
  \[' git browse', 'Gbrowse'],
  \[' git head', 'Gedit HEAD^'],
  \[' git parent', 'edit %:h'],
  \[' git log commit buffers', 'Glog --'],
  \[' git log current file', 'Glog -- %'],
  \[' git log last n commits', 'exe "Glog -" input("num: ")'],
  \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
  \[' git log until date', 'exe "Glog --until=" input("day: ")'],
  \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
  \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
  \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
  \[' git mv', 'exe "Gmove " input("destination: ")'],
  \[' git grep',  'exe "Ggrep " input("string: ")'],
  \[' git prompt', 'exe "Git! " input("command: ")'],
  \] " Append ' --' after log to get commit info commit buffers
nnoremap <silent> <Leader>g :Unite -silent -buffer-name=git -start-insert menu:git<CR>
"}}}

" Vim JSON: {{{
" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0
"  }}}

" vim-node: {{{
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
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

" vim-easy-align: {{{
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Navigate between vim buffers and tmux panels ------------------------------{{{
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
"}}}

" Section User Interface {{{

" code folding settings
set foldmethod=syntax " fold based on syntax
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=99
set foldtext=MyFoldText()

set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set wildmode=full
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height
set nrformats-=octal
set confirm
set complete=.,w,b,u,t,k " http://usevim.com/2015/06/03/spelling-tips/
set completeopt+=noselect,menu,preview

set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set lazyredraw

set magic " Set magic on, for regex
set ttimeout " Fast timeout
set ttimeoutlen=20

set showmatch " show matching braces

" No annoying sound on errors
set belloff=all

" switch syntax highlighting on
syntax on

if !has('nvim')
  set encoding=utf-8
endif
set fileencodings=utf-8
set ambiwidth=double
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
highlight TermCursor ctermfg=red guifg=red
" Highlight line number of where cursor currently is
highlight CursorLineNr guifg=#050505

set number " show line numbers

set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
let &showbreak='…' " show ellipsis at breaking

set autoindent " automatically set indent of new line
set smartindent
" }}}

" Section AutoGroups {{{
" file type specific settings
augroup configgroup
  autocmd!
  autocmd FileType vim setlocal ts=2 sw=2 sts=2 fdc=1 foldmethod=marker foldlevel=0
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab indentkeys-=*<return>
  autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType jade setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 wrap spell
  autocmd FileType .xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
  autocmd FileType crontab setlocal nobackup nowritebackup
  autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
  autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}
  autocmd FileType coffee setl foldmethod=indent

  " automatically resize panes on resize
  autocmd VimResized * exe 'normal! \<c-w>='
  " save all files on focus lost, ignoring warnings about untitled buffers
  autocmd FocusLost * silent! wa

  autocmd BufNewFile,BufRead *.ejs set filetype=html
  autocmd BufNewFile,BufRead *.ino set filetype=c
  autocmd BufNewFile,BufRead *.svg set filetype=xml
  autocmd BufNewFile,BufRead .babelrc set filetype=json
  autocmd BufNewFile,BufRead .jshintrc set filetype=json
  autocmd BufNewFile,BufRead .eslintrc set filetype=json
  autocmd BufNewFile,BufRead *.es6 set filetype=javascript

  " make quickfix windows take all the lower section of the screen
  " when there are multiple windows open
  autocmd FileType qf wincmd J

  " turn on spelling for markdown files
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell filetype=markdown
  " highlight bad words in red
  autocmd BufRead,BufNewFile *.md hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

  autocmd BufWritePre * call StripTrailingWhitespace()

  " Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
              " center buffer around cursor when opening files
  autocmd BufRead * normal zz

  " TypeScript hint
  autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>

  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
  " auto-insert in terminals when focus in terminal window
  autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END

function! s:EscapeUnite()
    augroup CloseUniteBuffer
        autocmd!
        autocmd InsertEnter <buffer>
            \ let b:close = 0 |
            \ let g:udt = &updatetime |
            \ set updatetime=3

        autocmd InsertLeave <buffer>
            \ let b:close = 1

        autocmd BufLeave,CursorHold <buffer>
            \ let &updatetime = g:udt |
            \ unlet g:udt

        autocmd CursorHold <buffer>
            \ if b:close | close | endif
    augroup END
endfunction

augroup EscapeUnite
    autocmd!
    autocmd FileType unite call s:EscapeUnite()
augroup END
" }}}

" Section Mappings {{{

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" wipout buffer
nmap <silent> <leader>b :bw<cr>

" disable Ex mode
noremap Q <NOP>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" make the highlighting of tabs less annoying
highlight SpecialKey ctermbg=none
set showbreak=↪
nmap <leader>l :set list!<cr>

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
tnoremap <ESC> <C-\><C-n>

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

" Copy to osx clipboard
"vnoremap <C-c> "*y<CR>
vnoremap y "*y<CR>
nnoremap Y "*Y<CR>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

nmap <leader>w :setf textile<cr> :Goyo<cr>

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

