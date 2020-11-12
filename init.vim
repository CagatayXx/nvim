source $HOME/.config/nvim/vim-plug/plugins.vim
" TextEdit might fail if hidden is not set.
set hidden

set notimeout

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-css', 
  \ 'coc-stylelint', 
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" autocmd FileType scss setl iskeyword-=@-@

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" --------------------------------------------------------------------------------------------------------------------

" for Whichkey
"let g:maleader = "\<Space>"
"let g:maplocalleader = ','
"nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
"nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" For window transition
  map <C-h> :wincmd h<CR>
  map <C-l> :wincmd l<CR>

" Airline Settings
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#formatter = 'default'


" NERDTree Settings
  " Remove arrows
  let g:NERDTreeDirArrowExpandable = ' '
  let g:NERDTreeDirArrowCollapsible = ' '

  " Open NERDTree Automatically
  autocmd vimenter * NERDTree
  autocmd vimenter * :wincmd l

  " When File Opens Close NERDTRee Tab
  "let NERDTreeQuitOnOpen=1

  "a" utocmd VimEnter * if argc() != 0 && !exists("s:std_in") | wincmd l | endif
  " NERDTree Key
  map <C-e> :NERDTreeToggle<CR>
  " Close vim if the only window is NERDTree
  "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Open File or Folder with Space Key
  let NERDTreeMapActivateNode='<space>'

" Tag Highlighter
  let g:mta_use_matchparen_group = 1
  let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'js' : 1,
    \ 'jsx' : 1,
    \ 'ts' : 1,
    \ 'tsx' : 1,
    \}

" Closetag Settings -------------------------------------------

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" -------------------------------------------------------------

" Buffers key
  map <C-a> :Buffers<CR>

" Next and Previous Buffer Keys
  map <TAB> :bn<CR>
  map <S-TAB> :bp<CR>
  map <C-d> :call CleanClose(1)<CR>
  map <C-d> :call CleanClose(0)<CR>

  function! CleanClose(tosave)
  if (a:tosave == 1)
      w!
  endif
  let todelbufNr = bufnr("%")
  let newbufNr = bufnr("#")
  if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
      exe "b".newbufNr
  else
      bnext
  endif

  if (bufnr("%") == todelbufNr)
      new
  endif
  exe "bd".todelbufNr
  endfunction

" ********************************************************************

" FZF Finder
  map <C-p> :FZF<CR>
  map <C-g> :GFiles<CR>
  map <C-f> :Rg<CR>
  "map <C-p> :FGFilesZF<CR>
  " let $FZF_DEFAULT_COMMAND = 'fd --ignore-file'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
":autocmd BufEnter * silent! normal! g`"

" Press ESC to Close Search Highlight
  nnoremap <esc> :noh<return><esc>

" Remember Last Buffers
"exec 'set viminfo=%,' . &viminfo
"set viminfo^=%

" ESLint and Prettier
" let g:ale_fixers = {
"  \ 'scss': ['prettier', 'eslint']
"  \ }
"
" let g:ale_linters = {
"  \ 'scss': ['prettier', 'eslint']
"  \ }

" \ 'scss': ['prettier']

let g:ale_sign_error = ' ' 
" ✘

let g:ale_sign_warning = ' '
" ⚠

let g:ale_fix_on_save = 1

" NERDTree show hidden files
let NERDTreeShowHidden=1

" ------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

let mapleader=";"
set timeout timeoutlen=1500

" ------------------------------------------------------------

" Session Management
let g:session_autoload = 'no'
let g:session_autosave_periodic = 'yes'
let g:session_autosave = 'yes'
let g:session_lock_enabled = 'no'
autocmd VimLeavePre * :NERDTreeClose
"autocmd VimLeave * :SaveSession

"autocmd VimEnter * mkdir

"set nocompatible
"set wildmenu
"set wildmode=full
"syntax on
"filetype plugin on

"let g:session_dir = '~/vim-sessions/'
"exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '*.vim<C-D><BS><BS><BS><BS><BS>'
"exec 'nnoremap <Leader>sr :so ' . g:session_dir . '*.vim<C-D><BS><BS><BS><BS><BS>'

"let g:session_directory = '~/vim-sessions/'

"let g:session_directory="~/vim-sessions/"
"let g:session_lock_directory="~/vim-sessions/"

" Cursor Blinking
"set guicursor+=a:-blinkwait175-blinkoff150-blinkon175

" Hide Cursor When Focus to Another Window
" autocmd BufEnter * set cursorline
" autocmd BufLeave * set nocursorline

"Show Numbers and Highlight the Current Line
set number
set relativenumber
set cursorline

" Save on Ctrl-S
map <C-s> :w<CR>

" console.log shortcut
"imap clg console.log()<Esc><S-f>(a
" Console log from visual mode on next line, puts visual selection inside parentheses
"vmap clg yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
"nmap clg yiwocll<Esc>p

"Themes
" colo gruvbox
colorscheme gruvbox
"let g:airline_theme='onehalfdark'
syntax on

