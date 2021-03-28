call plug#begin('~/.vim/plugged')
  Plug 'tomasiser/vim-code-dark'
  " Plug 'pangloss/vim-javascript'
  Plug 'itchyny/vim-gitbranch'
  Plug 'itchyny/lightline.vim'
  Plug 'szw/vim-maximizer'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'
  Plug 'sbdchd/neoformat'
  Plug 'tpope/vim-fugitive'
  " Plug 'airblade/vim-gitgutter'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'janko/vim-test'
  Plug 'puremourning/vimspector'
  Plug 'vimwiki/vimwiki'
  Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'junegunn/goyo.vim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
  \}
  Plug 'alaviss/nim.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  " Plug 'mfussenegger/nvim-dap'
  " Plug 'theHamsta/nvim-dap-virtual-text'
call plug#end()
 
" default options
set completeopt=menu,menuone,noselect " better autocomplete options
set mouse=a " if I accidentally use the mouse
set splitright " splits to the right
set splitbelow " splits below
set expandtab " space characters instead of tab
set tabstop=2 " tab equals 2 spaces
set shiftwidth=2 " indentation
set number " show absolute line numbers
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
set diffopt+=vertical " starts diff mode in vertical split
set hidden " allow hidden buffers
set nobackup " don't create backup files
set nowritebackup " don't create backup files
set cmdheight=1 " only one line for commands
set shortmess+=c " don't need to press enter so often
set signcolumn=yes " add a column for sings (e.g. GitGutter, LSP, ...)
set updatetime=520 " time until update
set undofile " persists undo tree
filetype plugin indent on " enable detection, plugins and indents
let mapleader = " " " space as leader key
if (has("termguicolors"))
  set termguicolors " better colors, but makes it very slow!
endif
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown
nnoremap <leader>v :e $MYVIMRC<CR>

" tomasiser/vim-code-dark
"colorscheme codedark

" lewis6991/gitsigns.nvim
lua require('gitsigns').setup()


" itchyny/lightline.vim and itchyny/vim-gitbranch
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

" szw/vim-maximizer
nnoremap <silent> <C-w>m :MaximizerToggle!<CR>

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
" let g:neoterm_size = 100
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <c-y> :Ttoggle<CR>
inoremap <c-y> <Esc>:Ttoggle<CR>
tnoremap <c-y> <c-\><c-n>:Ttoggle<CR>
nnoremap <leader>x :TREPLSendLine<CR>
vnoremap <leader>x :TREPLSendSelection<CR>
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif

" sbdchd/neoformat
nnoremap <leader>F :Neoformat prettier<CR>

" nvim-telescope/telescope.nvim
nnoremap <leader><space> :Telescope git_files<CR>
" nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>FF :Telescope find_files<CR>
nnoremap <leader>fg :Telescope git_branches<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
" nnoremap <leader>ff : lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input("Grep For >") }<CR>


" tpope/vim-fugitive
nnoremap <leader>gg :G<cr>
nnoremap <leader>gd :Gdiff master<cr>
nnoremap <leader>gl :G log -100<cr>
nnoremap <leader>gp :G push<cr>

" neovim/nvim-lspconfig
lua require'lspconfig'.tsserver.setup{}
lua << EOF
local lspconfig = require'lspconfig'
  lspconfig.rust_analyzer.setup({
      settings = {
          ["rust-analyzer"] = {
              assist = {
                  importMergeBehavior = "last",
                  importPrefix = "by_self",
              },
              cargo = {
                  loadOutDirsFromCheck = true
              },
              procMacro = {
                  enable = true
              },
          }
      }
  })
EOF

lua << EOF
require'lspconfig'.nimls.setup{}
EOF




nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

" 'hrsh7th/nvim-compe'
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- treesitter = true;
  };
}
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

" janko/vim-test
nnoremap <silent> tt :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
nnoremap <silent> ts :TestSuite<CR>
nnoremap <silent> t_ :TestLast<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"

" puremourning/vimspector
 fun! GotoWindow(id)
   :call win_gotoid(a:id)
 endfun
 func! AddToWatch()
   let word = expand("<cexpr>")
   call vimspector#AddWatch(word)
 endfunction
 let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
 let g:vimspector_sidebar_width = 60
 nnoremap <leader>da :call vimspector#Launch()<CR>
 nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
 nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
 nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
 nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
 nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
 nnoremap <leader>di :call AddToWatch()<CR>
 nnoremap <leader>dx :call vimspector#Reset()<CR>
 nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
 nnoremap <S-k> :call vimspector#StepOut()<CR>
 nnoremap <S-l> :call vimspector#StepInto()<CR>
 nnoremap <S-j> :call vimspector#StepOver()<CR>
 nnoremap <leader>d_ :call vimspector#Restart()<CR>
 nnoremap <leader>dn :call vimspector#Continue()<CR>
 nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
 nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
 nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
 let g:vimspector_sign_priority = {
   \    'vimspectorBP':         998,
   \    'vimspectorBPCond':     997,
   \    'vimspectorBPDisabled': 996,
   \    'vimspectorPC':         999,
   \ }

" janko/vim-test and puremourning/vimspector
nnoremap <leader>dd :TestNearest -strategy=jest<CR>
function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction      
let g:test#custom_strategies = {'jest': function('JestStrategy')}

" CDS
augroup MyCDSCode
    autocmd!
    autocmd BufReadPre,FileReadPre *.cds set ft=cds
augroup END
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
    lspconfig.sapcds_lsp.setup{ }
  end
EOF
" vimwiki/vimwiki
nnoremap <Leader>tl <Plug>VimwikiToggleListItem
vnoremap <Leader>tl <Plug>VimwikiToggleListItem
nnoremap <Leader>wn <Plug>VimwikiNextLink
let g:vimwiki_global_ext = 0
let wiki = {}
let wiki.nested_syntaxes = { 'js': 'javascript' }
let g:vimwiki_list = [wiki] 

" nvim/treesitter
colorscheme onedark
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
EOF

set foldmethod=expr
setlocal foldlevelstart=99
set foldexpr=nvim_treesitter#foldexpr()

" 'junegunn/goyo.vim'
let g:goyo_width = 150
nmap <silent> <Leader>l :Goyo<CR>

" mfussenegger/nvim-dap
" lua << EOF
" local dap = require('dap')
" dap.adapters.node2 = {
"   type = 'executable',
"   command = 'node',
"   args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
" }
" vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
" vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
" EOF
" nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <S-k> :lua require'dap'.step_out()<CR>
" nnoremap <S-l> :lua require'dap'.step_into()<CR>
" nnoremap <S-j> :lua require'dap'.step_over()<CR>
" nnoremap <leader>dn :lua require'dap'.continue()<CR>
" nnoremap <leader>d_ :lua require'dap'.run_last()<CR>
" nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
" nnoremap <leader>di :lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>
" vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
" nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
" nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
" nnoremap <leader>da :lua require'debugHelper'.attach()<CR>

" theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
" let g:dap_virtual_text = v:true

" jank/vim-test and mfussenegger/nvim-dap
" nnoremap <leader>dd :TestNearest -strategy=jest<CR>
" function! JestStrategy(cmd)
"   let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
"   let fileName = matchlist(a:cmd, '\v'' -- (.*)$')[1]
"   call luaeval("require'debugHelper'.debugJest([[" . testName . "]], [[" . fileName . "]])")
" endfunction      
" let g:test#custom_strategies = {'jest': function('JestStrategy')}
