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
   Plug 'morhetz/gruvbox'
   Plug 'neovim/nvim-lspconfig'
   Plug 'nvim-lua/completion-nvim'
   Plug 'puremourning/vimspector'
   Plug 'szw/vim-maximizer'
   Plug 'sonph/onehalf', {'rtp': 'vim/'}
   Plug 'sbdchd/neoformat'
   Plug 'tpope/vim-fugitive'
   Plug 'nicwest/vim-http'
   Plug 'Lenovsky/nuake'
call plug#end()
 
set completeopt=menuone,noinsert,noselect
set mouse=a
set splitright
set splitbelow
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
set statusline=%f
set ignorecase
set number relativenumber
set smartcase
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:netrw_banner=0
let g:vim_http_split_vertically=1

let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']

filetype plugin indent on

colorscheme gruvbox

let mapleader = " "
 
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"


nnoremap <leader>e :Http<CR>

" Window mappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

fun! GotoWindow(id)
  :call win_gotoid(a:id)
endfun

let g:vimspector_base_dir = '/Users/d065023/.config/vimspector-config'

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




nmap <leader>ec :vs $MYVIMRC<CR>

nnoremap <leader>F :Neoformat prettier<CR>
 
nnoremap <leader>gs :G<cr>
nnoremap <leader>gb :G branch<cr>
nnoremap <leader>gd :G diff<cr>
nnoremap <leader>gl :G log -100<cr>
 
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>

function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction      


let g:test#custom_strategies = {'jest': function('JestStrategy')}

 
" Maps ESC to exit terminal's insert mode
if has('nvim')
 tnoremap <Esc> <C-\><C-n>
endif
 
" Maps ctrl-b + % to open a new vertical split with a terminal
"nnoremap <leader><cr> :vnew +terminal<CR>
"
let g:nuake_position = "right"
let g:nuake_per_tab = 1
let g:nuake_start_insert = 1
nnoremap <leader><cr> :Nuake<CR>

nnoremap <leader><space> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

" " Enter Terminal-mode (insert) automatically
"autocmd TermOpen * startinsert

lua << EOF
local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
configs.sapcds_lsp = {
  default_config = {
    cmd = {"/users/d065023/projects/startcdslsp"};
    filetypes = {'cds'};
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}
lspconfig.sapcds_lsp.setup{ on_attach=require'completion'.on_attach }
EOF

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }



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

" Statusline
"function! GitBranch()
    "return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction

"function! StatuslineGit()
  "let l:branchname = GitBranch()
  "return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction

set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\%p%%
set statusline+=\ %l:%c

augroup MyCDSCode
" Files with extension .cds are processed as cds code
    autocmd!
    autocmd BufReadPre,FileReadPre *.cds set ft=cds
augroup END
 

endif

