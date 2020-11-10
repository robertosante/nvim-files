" -- Begin Plug Directory
call plug#begin('~/.local/share/nvim/plugged')
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Yggdroot/indentLine'
Plug 'haya14busa/incsearch.vim'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-rooter'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-system-copy'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'haydenrou/tickit.vim'
Plug 'vifm/vifm.vim'
Plug 'keith/rspec.vim'
Plug 'thoughtbot/vim-rspec'
call plug#end()
" -- Basic Vim Config
" Leader
let mapleader = "\<Space>"
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set noshowmode
set autowrite     " Automatically :write before running commands
set mouse=a        " make vim clickable
set spelllang=en   " spelling in english
set pastetoggle=<F2>    " allow pasting with correct indentation
set cursorline
set smartindent
set nowrap
set hidden
set ignorecase
set smartcase
set lazyredraw
set magic
set exrc
set number
set completeopt=menuone,noinsert,noselect
set updatetime=50
set inccommand=split
set spell spelllang=en_gb
nnoremap <leader>sp :norm mm[s1z=`m<cr>
set shiftround
set expandtab
set encoding=UTF-8
set shiftround
set expandtab
" To automatically unfold all of a file
set foldlevelstart=99
" Use one space, not two, after punctuation.
set nojoinspaces
set vb t_vb=
set undofile
" https://github.com/junegunn/fzf.vim/issues/456
" Depending where it's installed
set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
" Use RG for grepping
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
" Splits open to the right and below
set splitbelow splitright
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
autocmd BufWritePre * %s/\s\+$//e
let loaded_netrwPlugin = 1

filetype off                  " required
"set cursorline
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set shiftround
"set noshowmode
"let loaded_vifm=1
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Vifm
map <Leader>vv :Vifm<CR>

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
set background=dark
colorscheme dracula
" -- Begin FZF Config
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <C-f> :Rg
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" -- Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Auto complete
autocmd FileType javascript,javascriptreact,javascript.jsx,javascript.tsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
autocmd BufNewFile,BufRead *.tsx set syntax=javascriptreact
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" Panel Movement -- use alt+hjkl to move between split/vsplit panels
tnoremap <C-Left> <C-\><C-n><C-w>h
tnoremap <C-Down> <C-\><C-n><C-w>j
tnoremap <C-Up> <C-\><C-n><C-w>k
tnoremap <C-Right> <C-\><C-n><C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
" -- Lightline Config
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }
" -- IncSearch Config
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
" -- Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1
" -- NerdCommenter
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
" -- Other Config
set wildmode=list:longest,list:full
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" for easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
autocmd FileType html,css,erb,jsx,javascript,rb,typescriptreact,javascriptreact,scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType go set softtabstop=0 noexpandtab
autocmd FileType html,css,erb,jsx,javascript,typescriptreact,javascriptreact EmmetInstall
" https://github.com/tpope/vim-commentary/issues/68
autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal commentstring={/*\ %s\ */}
"Coc Config
func GoCoC()
    :CocEnable
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nmap <buffer> <leader>rr <Plug>(coc-rename)
    nnoremap <buffer> <leader>cr :CocRestart
endfun
" PLUGIN: Fugitive
nmap <leader>gst    :G<CR>
nmap <leader>gRight  :diffget //3<CR>
nmap <leader>gLeft   :diffget //2<CR>
nmap <leader>gdf    :Gdiff<CR>

"Coc fzf Preview
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
" -- Rspec Config
map <Leader>rspecc :call RunCurrentSpecFile()<CR>
map <Leader>rspecn :call RunNearestSpec()<CR>
map <Leader>rspecl :call RunLastSpec()<CR>
map <Leader>rspeca :call RunAllSpecs()<CR>
