if !exists('g:vscode')


call plug#begin('~/.vim/plugged')
   Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }
   Plug 'drewtempelmeyer/palenight.vim'
   Plug 'larsbs/vimterial_dark'
   Plug 'janko/vim-test'
   Plug 'rakr/vim-one'
   Plug 'scrooloose/nerdcommenter'
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'
   Plug 'neovim/nvim-lspconfig'
   Plug 'nvim-lua/completion-nvim'
   Plug 'puremourning/vimspector'
   Plug 'szw/vim-maximizer'
   Plug 'sonph/onehalf', {'rtp': 'vim/'}
   Plug 'sbdchd/neoformat'
   Plug 'tpope/vim-fugitive'
   Plug 'kassio/neoterm'
   Plug 'christoomey/vim-tmux-navigator'
   Plug 'vimwiki/vimwiki'
   Plug 'itchyny/lightline.vim'
   Plug 'itchyny/vim-gitbranch'
   Plug 'christianchiarulli/nvcode-color-schemes.vim'
   "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
   " Remove once tree sitter works better:
   Plug 'https://github.com/tomasiser/vim-code-dark'
   Plug 'pangloss/vim-javascript'
call plug#end()
 
set completeopt=menuone,noinsert,noselect
set mouse=a
set splitright
set splitbelow
set tabstop=2
set shiftwidth=2
set expandtab
set statusline=%f
set number
set ignorecase
set smartcase
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
"set updatetime=300
set shortmess+=c
set signcolumn=yes

let mapleader = " "

if (has("termguicolors"))
 set termguicolors
endif

let g:netrw_banner=0
let g:vim_http_split_vertically=1

let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']

let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 100
let g:neoterm_autoinsert = 1

nnoremap <c-f> :Ttoggle<CR>
inoremap <c-f> <Esc>:Ttoggle<CR>
tnoremap <c-f> <c-\><c-n>:Ttoggle<CR>

filetype plugin indent on


 
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"


fun! GotoWindow(id)
  :call win_gotoid(a:id)
endfun

let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
let g:vimspector_sidebar_width = 120
let g:vimspector_bottombar_height = 0



"func! CustomiseUI()
    "call win_gotoid( g:vimspector_session_windows.code )
"endfunction

"augroup MyVimspectorUICustomistaion
  "autocmd!
  "autocmd User VimspectorUICreated call CustomiseUI()
"augroup END
"
func! AddToWatch()
  let word = expand("<cexpr>")
  :echom word
  call vimspector#AddWatch(word)
endfunction

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dd :TestNearest -strategy=jest<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>d? :call AddToWatch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>

nmap <S-k> <Plug>VimspectorStepOut
nmap <S-l> <Plug>VimspectorStepInto
nmap <S-j> <Plug>VimspectorStepOver
nmap <leader>d_ <Plug>VimspectorRestart
nmap <leader>dn :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dh <Plug>VimspectorToggleBreakpoint
nmap <leader>de <Plug>VimspectorToggleConditionalBreakpoint




nmap <leader>v :vs $MYVIMRC<CR>

nnoremap <leader>F :Neoformat prettier<CR>
 
nnoremap <leader>gg :G<cr>
nnoremap <leader>gb :G branch<cr>
nnoremap <leader>gd :G diff<cr>
nnoremap <leader>gl :G log -100<cr>
 
nmap <silent> tt :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> t_ :TestLast<CR>

function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction      


let g:test#custom_strategies = {'jest': function('JestStrategy')}

 
" Maps ESC to exit terminal's insert mode
if has('nvim')
 "tnoremap <Esc> <C-\><C-n>
 au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
 au! FileType fzf tunmap <buffer> <Esc>
endif
 
nnoremap <leader><space> :GFiles<CR>
nnoremap <leader>fh :History:<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ff :Ag<CR>

" " Enter Terminal-mode (insert) automatically
"autocmd TermOpen * startinsert

lua << EOF
local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
configs.sapcds_lsp = {
  default_config = {
    cmd = {vim.fn.expand("$HOME/projects/startcdslsp")};
    filetypes = {'cds'};
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}
if lspconfig.sapcds_lsp.setup then
  lspconfig.sapcds_lsp.setup{ on_attach=require'completion'.on_attach }
end

lspconfig.tsserver.setup{ on_attach=require'completion'.on_attach }
EOF



nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gc     <cmd>lua vim.lsp.buf.completion()<CR>
nnoremap <silent> gH    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>


let g:neoformat_enabled_python = ['prettierstandard']
let g:neoformat_javascript_prettierstandard = {
            \ 'exe': 'prettier-standard',
            \ 'replace': 1
            \ }

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'codedark',
      \ }

augroup MyCDSCode
" Files with extension .cds are processed as cds code
    autocmd!
    autocmd BufReadPre,FileReadPre *.cds set ft=cds
augroup END

inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))



nmap <Leader>tl <Plug>VimwikiToggleListItem
vmap <Leader>tl <Plug>VimwikiToggleListItem
nmap <Leader>wn <Plug>VimwikiNextLink

colorscheme codedark
" colorscheme nvcode
" Enable once tree sitter works better
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
  "highlight = {
    "enable = true,
  "},
  "incremental_selection = {
    "enable = true,
    "keymaps = {
      "init_selection = "gnn",
      "node_incremental = "gni",
    "},
  "},
  "indent = {
    "enable = true
  "}
"}
"EOF

"set foldmethod=expr
"setlocal foldlevelstart=99
"set foldexpr=nvim_treesitter#foldexpr()

endif

