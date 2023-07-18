let mapleader = " "

set background=dark
set guifont=FiraCode\ Nerd\ Font:h10

set encoding=UTF-8

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set clipboard=unnamed

set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set termguicolors

set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

set incsearch
set scrolloff=8

set signcolumn=yes
set colorcolumn=80

set ignorecase

" Make sure Vim-Plug is downloaded and installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'

Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'scrooloose/nerdcommenter'

Plug 'christoomey/vim-tmux-navigator'

Plug 'kdheepak/lazygit.nvim'

Plug 'morhetz/gruvbox'

" RGB colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'mrk21/yaml-vim' " YAML Syntax
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'tomlion/vim-solidity' " Solidity Syntax
Plug 'sheerun/vim-polyglot' " A whole bunch of language syntax
Plug 'pantharshit00/vim-prisma' " Prisma
Plug 'rust-lang/rust.vim' " Rust

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " MD Preview
call plug#end()

colorscheme gruvbox

"Plugin Settings
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeLimitedSyntax = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    ""\ "Staged"    : "#0ee375",
    ""\ "Modified"  : "#d9bf91",
    ""\ "Renamed"   : "#51C9FC",
    ""\ "Untracked" : "#FCE77C",
    ""\ "Unmerged"  : "#FC51E6",
    ""\ "Dirty"     : "#FFBD61",
    ""\ "Clean"     : "#87939A",
    ""\ "Ignored"   : "#808080"
    ""\ }


let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Jest-runner
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

" Hex COLORS
let g:Hexokinase_highlighters = [ 'virtual' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" Telescope
nnoremap <C-p> <cmd>Telescope find_files hidden=true<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" sync open file with NERDTree
" " Check if NERDTree is open or active
"function! IsNERDTreeOpen()
  ""return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

"" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
"function! SyncTree()
  ""if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    ""NERDTreeFind
    ""wincmd p
  ""endif
"endfunction

"" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-solidity',
  \ ]

autocmd FileType scss setl iskeyword+=@-@

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
   inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

"      Use "`g`[ and ]`g` to navigate diagnostics
"      Use :CocDiagnostics`` to get all diagnostics of current buffer in
"      location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

    "       GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

    "       Use T to show documentation in preview window.
nnoremap <silent> T :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
     call CocActionAsync('doHover')
    else
       call feedkeys('K', 'in')
     endif
endfunction

"                      Highlight the symbol and its references when
"                      holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  "" Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

" Key Remappings
" Remap semi-colon to colon
nnoremap ; :
"Edit .vimrc
nnoremap <leader>ev :split ~/.config/nvim/init.vim<cr>
" Source vimrc
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
" Save and quit
nnoremap zz :wq<cr>

" Surround selection
" Single-quotes
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>el
" Double-quotes
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>el
" Curly braces
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>`>el
" Square brackets
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>`>el
" HTML brackets
vnoremap <leader>< <esc>`>a><esc>`<i<<esc>`>el
" Backticks
vnoremap <leader>` <esc>`>a`<esc>`<i`<esc>`>el

" Move current line
nnoremap <S-j> ddp
nnoremap <S-k> ddk<S-p>

" Move current selection
vnoremap <S-j> d`]pV`]
vnoremap <S-k> dkP`[V`]

" Convert require to import and vice versa
nnoremap <leader>cr 0cwconst<esc>/from<CR>cw=<space>require(<esc>lxA<backspace>);<esc>
nnoremap <leader>ci 0cwimport<esc>f=xifrom<esc>lldwxA<backspace><backspace>;<esc>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup REMOVE_WHITESPACE_ON_SAVE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Snippets
augroup cdi_snippet
    autocmd!
    autocmd FileType typescript iabbrev cdi console.dir()<left>
    autocmd FileType javascript iabbrev cdi console.dir()<left>
augroup END

" Remove PgUp and Dn
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>
