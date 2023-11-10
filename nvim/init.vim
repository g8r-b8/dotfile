set so=20
set relativenumber
syntax on
set autoindent
set smartindent
set cursorline
set cursorcolumn
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nowrap
set incsearch
set noswapfile
set backspace=indent,eol,start
nnoremap <SPACE> <Nop>
let mapleader = " "
set mouse=

" git
nnoremap <Leader>gg :! git add .; git commit -m 'update'; git push origin capiq_dev <enter>

" FZF mappings
nnoremap <Leader>b :Buffer<CR>
xnoremap <Leader>b :Buffer<CR>
nnoremap <Leader>; :Commands<CR>
xnoremap <Leader>; :Commands<CR>
nnoremap <C-p> <esc>:Files<CR>
xnoremap <C-p> :Files<CR>
nnoremap <Leader>p <esc>:GFiles<CR>
xnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>rg :Rg<CR>
xnoremap <Leader>rg :Rg<CR>
nnoremap <Leader>ag :Ag<CR>
xnoremap <Leader>ag :Ag<CR>

" tmux-vim navigator mappings
let g:tmux_navigator_no_mappings = 1

noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
" noremap <silent> <c-> :<C-U>TmuxNavigatePrevious<cr>


noremap <silent> <c-t> :<C-U>FloatermToggle<cr>



" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug '/usr/bin/fzf' " make sure you install this
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-source-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'voldikss/vim-floaterm'

" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Vim Nav
Plug 'christoomey/vim-tmux-navigator'

" Pretty notifs
Plug 'rcarriga/nvim-notify'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()





" FZF with preview for files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \ fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}),
  \ <bang>0)
" Hide cmd buffer for fzf
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
 \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" fix indent etc on save
" NOTE: if having problems ensure you have the linter (pylint for example)
" installed
"let g:ale_fixers = ['pylint', 'autopep8']
"let g:ale_fixers = {
"    \  'python': ['autopep8'],
"    \  'javascript': ['eslint', 'prettier']
"    \}
"   \  'typescript': ['eslint', 'prettier'],
"   \  'typescriptreact': ['eslint', 'prettier'],
"   \  'css': ['stylelint', 'prettier'],
"   \  'html': ['prettier'],
"   \  'json': ['fixjson'],
"   \  'yaml': ['yamlfix']
"   \}
let g:ale_fix_on_save = 0
" ignore missing imports for mypy
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_linters = {}
let g:ale_linters.bash = [ 'shellcheck' ]
let g:ale_linters.typescript = [ 'eslint' ]
let g:ale_linters.typescriptreact = [ 'eslint' ]
let g:ale_linters.javascript = [ 'eslint' ]
let g:ale_linters.json = [ 'spectral' ]
let g:ale_linters.yaml = [ 'spectral' ]
"let g:ale_sign_column_always = 1
"let g:ale_change_sign_column_color = 1 
"autocmd FileType elixir,eelixir nnoremap <Leader>f :ALEFix<CR>

" use bracket bindings to navgiate ale specific errors/warnings
nmap <silent> [r <Plug>(ale_previous_wrap)
nmap <silent> ]r <Plug>(ale_next_wrap)

" Deoplete
let g:deoplete#enable_at_startup = 1
" let g:python_host_prog='/usr/bin/python3'
let g:python3_host_prog='/usr/bin/python3'

