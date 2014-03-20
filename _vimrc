" vim: se fenc=cp932 :
" initialize neobundle
" {{{
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/vimfiles/bundle'))
let g:neobundle#types#git#default_protocol='https'

" override default value on windows (= rmdir /S /Q) because it runs git's
" rmdir in my environment.
let g:neobundle#rm_command='rd /S /Q'

NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimshell.git'
"NeoBundle 'https://github.com/tyru/skk.vim.git'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'DirDiff.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'haskellmode-vim', {'type' : 'nosync'}
NeoBundle 'tracticket', {'type' : 'nosync'}
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'mattn/learn-vimscript.git'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'thinca/vim-editvar'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'thinca/vim-ref'
NeoBundle 'soh335/vim-ref-jquery'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'vim-scripts/vimwiki'
NeoBundle 'mattn/vim-metarw'
NeoBundle 'unite-font'
NeoBundle 'choplin/unite-vim_hacks'
NeoBundle 'mattn/wwwrenderer-vim'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-scripts/tracwiki'
NeoBundle 'itchyny/calendar.vim'

filetype plugin on
filetype indent on

NeoBundleCheck
" }}}

se tags& tags+=$HOME/tags

se bs=2
se visualbell

" " ascii style tab
" if (match(&guioptions, 'e') >= 0)
"   se guioptions-=e
" endif
" se showtabline=2
" 
" " customize tab line
" " http://d.hatena.ne.jp/thinca/20111204/1322932585
" " {{{
" " 各タブページのカレントバッファ名+αを表示
" function! s:tabpage_label(n)
"   " t:title と言う変数があったらそれを使う
"   let title = gettabvar(a:n, 'title')
"   if title !=# ''
"     return title
"   endif
" 
"   " タブページ内のバッファのリスト
"   let bufnrs = tabpagebuflist(a:n)
" 
"   " カレントタブページかどうかでハイライトを切り替える
"   let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
" 
"   " バッファが複数あったらバッファ数を表示
"   let no = len(bufnrs)
"   if no is 1
"     let no = ''
"   endif
"   " タブページ内に変更ありのバッファがあったら '+' を付ける
"   let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
"   let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける
" 
"   " カレントバッファ
"   let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
"   let fname = pathshorten(bufname(curbufnr))
" 
"   let label = no . mod . sp . (fname ==# '' ? '[無名]' : fname)
" 
"   return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
" endfunction
" 
" function! MakeTabLine()
"   let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
"   let sep = ' | '  " タブ間の区切り
"   let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
"   let info = fnamemodify(getcwd(), ":~") . ' ' " 好きな情報を入れる
"   return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
" endfunction
" 
" "set tabline=%!MakeTabLine()
" " }}}

" search
se nohlsearch
se nowrapscan

" tab
se tabstop=4
se expandtab

" listchars
se list
se listchars=tab:>_,extends:>,precedes:<,trail:_

" shift
se shiftround
se shiftwidth=2

" hardcopy
se printheader=%=%f
se printoptions=syntax:n,number:y

" only decimal numbers when increment/decrement
se nrformats=

" show encoding & fileformat at statusline
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 

" modify <LocalLeader> -> Space
let maplocalleader=' '

" auto set/unset hlsearch
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" mapping for insert time/date
imap <silent> <M-;> <C-R>=strftime("%Y/%m/%d")<CR>
imap <silent> <M-+> <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
nnoremap <silent> <M-;> i<C-R>=strftime("%Y/%m/%d")<CR><ESC>
nnoremap <silent> <M-+> i<C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR><ESC>

" always IME OFF when start inserting
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
inoremap <silent> <c-c> <ESC>:set iminsert=0<CR>

" immediate search by selected text
vnoremap g/ :<C-u>set hlsearch<CR>gvy/<C-R>"<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Ctrl-Tab is gt
nnoremap <C-Tab> gt

" MyAutoCmd group
augroup MyAutoCmd
  autocmd!
  autocmd BufEnter * if (bufname("") !~ "^\[A-Za-z0-9\]*://" && bufname("") !~ "^vimfiler.*") | lcd %:p:h | endif
augroup END


""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
scriptencoding cp932
function! ZenkakuSpace()
  "ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  "全角スペースを明示的に表示する。
  silent! match ZenkakuSpace /　/
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

" WOIM
au MyAutoCmd BufRead,BufNewFile *.woim set filetype=woim

" vorg
au MyAutoCmd BufRead,BufNewFile *.vorg set filetype=vorg

" reStructuredText
augroup MyReSTAutoCmd
  autocmd!
  au BufRead,BufNewFile */rst/*.txt set syntax=rst
  au BufWrite */rst/*.txt set fenc=utf8
  "au BufWritePost */rst/*.txt call Execute_rst2html()
  "au BufWritePost *.rst call Execute_rst2s5()
  au Syntax rst nnoremap <buffer> <Leader>1 yyp<c-v>$r=<esc>
  au Syntax rst nnoremap <buffer> <Leader>2 yyp<c-v>$r+<esc>
  au Syntax rst nnoremap <buffer> <Leader>3 yyp<c-v>$r-<esc>
  au Syntax rst nnoremap <buffer> <Leader>4 yyp<c-v>$r~<esc>
  au Syntax rst nnoremap <buffer> <Leader>5 yyp<c-v>$r^<esc>
  au Syntax rst nnoremap <buffer> <Leader>6 yyp<c-v>$r'<esc>
  au Syntax rst nnoremap <buffer> <Leader>f 
              \:execute "normal i.. figure:: ./figure/"
              \. expand('%:r') . "/"<CR>
  au Syntax rst nnoremap <buffer> <Leader>n i.. note:: 
  au Syntax rst nnoremap <buffer> <Leader>w i.. warning:: 
  au Syntax rst vnoremap <buffer> <Leader>b y`>a <esc>`<v`>xi **<esc>pa** <esc>f x:noh<CR>
  au Syntax rst vnoremap <buffer> <Leader>[ y`>a <esc>`<v`>xi[<esc>pa]<esc>f x:noh<CR>
  au Syntax rst vnoremap <buffer> <Leader>{ y`>a <esc>`<v`>xi「<esc>pa」<esc>f x:noh<CR>
  "au BufEnter */rst/*.txt nnoremap ,h :execute "silent !\"C:\\Program Files\\Mozilla Firefox\\firefox.exe\" ..\\..\\help\\" . expand('%:r') . ".html"<CR>
augroup END

function! Execute_rst2html()
    exec "silent !python C:/Python27/Scripts/rst2html.py "
                \. expand('%:l') . " ../../help/" . expand('%:r')
                \. ".html"
endfunction

function! Execute_rst2s5()
    exec "silent !python C:/Python31/Scripts/rst2s5.py --input-encoding=utf8 --visible-controls --current-slide --theme=default "
                \. expand('%:l') . " " . expand('%:r')
                \. ".html"
endfunction

" vimwiki
let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 1
au MyAutoCmd Syntax vimwiki set foldlevel=8

let g:vimwiki_old_diary_unmodifiable = 1
augroup MyVimWikiAutoCmd
  autocmd!

  " prohibit modify old vimwiki-diary
  autocmd BufEnter,InsertEnter ~/vimwiki/diary/[0-9]*.wiki call s:unmodifiable_old_diary(expand('%:r'))
  function! s:unmodifiable_old_diary(bufroot)
    let s:today = strftime('%Y-%m-%d')
    if a:bufroot != s:today
      if &modified
        " auto save before set unmodifiable
        update
      endif
      if g:vimwiki_old_diary_unmodifiable == 1
        setlocal nomodifiable
      endif
    endif
  endfunction

  " disable indent-guide in vimwiki-diary
  autocmd BufEnter,BufRead ~/vimwiki/diary/*.wiki if exists(":IndentGuidesDisable") | IndentGuidesDisable | endif

  " lock neocomplcache in vimwiki-diary
  " autocmd BufEnter,BufRead ~/vimwiki/diary/*.wiki if exists(":NeoComplCacheLock") | NeoComplCacheLock

augroup END

" vbscript
augroup MyVBScript
  autocmd!
  au MyAutoCmd BufEnter *.vbs se dictionary=$HOME\vimfiles\dict\vbscript.dict
augroup END

" powershell
augroup MyPowershell
  autocmd!
  au MyAutoCmd FileType ps1 setlocal filetype=ps1
augroup END

" auto-mkdir (via vim-users.jp Hack#202)
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

" Unite
command! -nargs=? U Unite file_mru bookmark -input=<args>
nnoremap <silent> <LocalLeader>uu :U<CR>
nnoremap <silent> <LocalLeader>ub :Unite buffer<CR>
nnoremap <silent> <LocalLeader>ub :Unite buffer<CR>
nnoremap <silent> <LocalLeader>uf :Unite file buffer<CR>
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" calculator using python
command! -nargs=+ Calc echo system('python -c "from math import *; print(<args>);"')

" show TODAY command and mapping
command! Today echo strftime("%Y/%m/%d")
command! Now echo strftime("%Y/%m/%d %H:%M:%S")
nnoremap <silent> <LocalLeader>t :Today<CR>
nnoremap <silent> <LocalLeader>n :Now<CR>

" my helptags
command! MyHelpTags helptags ~/vimfiles/doc/
nnoremap <LocalLeader>ht :helptags ~/vimfiles/doc/<CR>

" " smartchr
" " inoremap <expr>= smartchr#one_of(' = ', ' == ', '=', '==')
" augroup SmartChr
"   autocmd!
"   autocmd Syntax html inoremap <expr>= smartchr#one_of('=')
"   autocmd Syntax jsp inoremap <expr>= smartchr#one_of('=')
" augroup END

" reload vimrc
command! ReloadVimrc source $MYVIMRC

" http://vim-users.jp/2009/11/hack96/
" enable completion for any language
" augroup CompleteAnyLanguage
"   autocmd!
"   autocmd FileType *
"         \   if &l:omnifunc == ''
"         \ |   setlocal omnifunc=syntaxcomplete#Complete
"         \ | endif
" augroup END
" filetype on

" thinca's local vimrc http://vim-users.jp/2009/12/hack112/ {{{
" Load settings for each location.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" }}}

" set/unset cursor cross-hair
command! CursorCrossON set cursorline cursorcolumn
command! CursorCrossOFF set nocursorline nocursorcolumn

" count {,g}vimrc
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)

" copy to clipboard EMF element's ID
" nnoremap <silent> <LocalLeader>id ^/id="<CR>3l"+yf":se nohlsearch<CR>

" do not backup for version-controled files
" augroup NoBackups
"   autocmd!
"   autocmd BufRead,BufNewFile c:/workspaces/**/*.* set nobackup
" augroup END

" " haskel-mode
" augroup MyHaskellGroup
"   autocmd!
"   au BufEnter *.hs compiler ghc
"   let g:ghc = "ghc.exe"
"   let g:haddock_browser = "C:/Program Files/Mozilla Firefox/firefox.exe"
"   let g:haddock_docdir="C:/Program Files/Haskell Platform/2011.2.0.1/doc/html"
" augroup END

" Preserve noeol (missing trailing eol) when saving file. In order
" to do this we need to temporarily 'set binary' for the duration of
" file writing, and for DOS line endings, add the CRs manually.
" For Mac line endings, also must join everything to one line since it doesn't
" use a LF character anywhere and 'binary' writes everything as if it were Unix.

" This works because 'eol' is set properly no matter what file format is used,
" even if it is only used when 'binary' is set.

augroup automatic_noeol
au!

"au BufWritePre  * call TempSetBinaryForNoeol()
"au BufWritePost * call TempRestoreBinaryForNoeol()

fun! TempSetBinaryForNoeol()
  let s:save_binary = &binary
  if ! &eol && ! &binary
    setlocal binary
    if &ff == "dos" || &ff == "mac"
      undojoin | silent 1,$-1s#$#\=nr2char(13)
    endif
    if &ff == "mac"
      let s:save_eol = &eol
      undojoin | %join!
      " mac format does not use a \n anywhere, so don't add one when writing in
      " binary (uses unix format always)
      setlocal noeol
    endif
  endif
endfun

fun! TempRestoreBinaryForNoeol()
  if ! &eol && ! s:save_binary
    if &ff == "dos"
      undojoin | silent 1,$-1s/\r$/
    elseif &ff == "mac"
      undojoin | %s/\r/\r/g
      let &l:eol = s:save_eol
    endif
    setlocal nobinary
  endif
endfun

augroup END

" local vimrc
if filereadable(expand('~/_vimrc.local'))
  source ~/_vimrc.local
endif

" dynamic insert template
"   via Vim テクニックバイブル 1-13
augroup repltemplates
  autocmd!
  " autocmd BufNewFile *.html 0r ~/.vim/skeleton.html
  " autocmd BufNewFile *.html %substitute#__DATE__#\=strftime("%Y-%m-%d')#ge
augroup END

" auto :copen after :vimgrep
"   via Vim テクニックバイブル 1-13
augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost vimgrep cw
augroup END

" vim-toggle
imap <C-q>t <Plug>ToggleI

" vim-indent-guides
"   via Vim テクニックバイブル 4-14
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" " arpeggio
" call arpeggio#map('i', '', 0, 'jk', '<Esc>')

" map C-@ to C-[ (escape from insert-mode)
"   Vim Hack#240
imap <C-@> <C-[>

" temporary macros
" nnoremap <LocalLeader>th :se noexpandtab<CR>o<BS></tr><CR><tr><th>aaa</th></tr><CR><tr><ESC>j
" nnoremap <LocalLeader>td :se noexpandtab<CR>o<BS></tr><CR><tr><td>aaa</td></tr><CR><tr><ESC>j
" nnoremap <LocalLeader>mm 0V/\/tr<CR>nxnnpnnj

" buffer delete but do not close tab
nnoremap <LocalLeader>bd :bd<CR>:tabnew<CR>

" JCL filetype
augroup jcl
    autocmd!
    autocmd BufEnter */JCL/**/* se filetype=jcl number
augroup END

" VJDE
let g:vjde_completion_key='<c-space>'

" auto correct
abbrev teh the

" windows-like file-saving
nnoremap <silent> <C-s> :update<CR>
inoremap <silent> <C-s> <ESC>:update<CR>a

" line number
se number

" speeddating
augroup speeddating
    autocmd!
    autocmd VimEnter * SpeedDatingFormat! %Y/%m/%d
    autocmd VimEnter * SpeedDatingFormat %Y/%m/%d
augroup END

" vimshell prompt
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" vim-quickrun
let g:quickrun_config = {}
let g:quickrun_config['dot']={
      \'type' : 'dot'
      \, 'command' : 'dot'
      \, 'cmdopt' : '-Tpng -o dot.png'
      \, 'outputter' : 'null'
      \, 'exec' : ['%c %o %s', 'rundll32.exe url.dll,FileProtocolHandler dot.png']
      \}

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" lightline.vim
let g:lightline = {
      \  'colorscheme' : 'wombat'
      \}

" vimfiler
let g:vimfiler_as_default_explorer = 1

" neocomplete
" {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}


" itchyny/calendar.vim
nnoremap <silent> <LocalLeader>cal :Calendar -view=year -split=holizontal -position=below -height=12<CR>
nnoremap <silent> <LocalLeader>clock :Calendar -view=clock<CR>

