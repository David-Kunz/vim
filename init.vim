call plug#begin('~/.vim/plugged')
  Plug 'szw/vim-maximizer'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'
  Plug 'sbdchd/neoformat'
  " Plug 'tpope/vim-fugitive'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  " Plug 'janko/vim-test'
  " Plug 'puremourning/vimspector'
  Plug 'vimwiki/vimwiki'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
  \}
  Plug 'alaviss/nim.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  " Plug 'folke/tokyonight.nvim'
  Plug 'mfussenegger/nvim-dap'
  " Plug 'rcarriga/nvim-dap-ui'
  Plug 'nvim-telescope/telescope-dap.nvim'
  Plug 'theHamsta/nvim-dap-virtual-text'
  Plug 'Mofiqul/vscode.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'
  Plug 'TimUntersberger/neogit'
  Plug 'sindrets/diffview.nvim'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'David-Kunz/jester'
  Plug 'vhyrro/neorg'
  Plug 'folke/zen-mode.nvim'
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
set signcolumn=yes " add a column for sings (e.g. LSP, ...)
set updatetime=520 " time until update
set undofile " persists undo tree
filetype plugin indent on " enable detection, plugins and indents
let mapleader = " " " space as leader key
if (has("termguicolors"))
  set termguicolors " better colors, but makes it sery slow!
endif
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown
nnoremap <leader>v :e $MYVIMRC<CR>

" lewis6991/gitsigns.nvim
lua << EOF
 require('gitsigns').setup({})
EOF

" 'hoob3rt/lualine.nvim'
lua << EOF
  require('lualine').setup({
  options = {
    theme = "vscode"
   }
  })
EOF

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
lua << EOF
_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").find_files({search_dirs = {_path}})
end
EOF
lua << EOF
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end
EOF

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist
      }
    }
  }
})
EOF

nnoremap <leader><space> :Telescope git_files<CR>
nnoremap <leader>fd :lua telescope_find_files_in_path()<CR>
nnoremap <leader>fD :lua telescope_live_grep_in_path()<CR>
nnoremap <leader>ft :lua telescope_find_files_in_path("./tests")<CR>
nnoremap <leader>fT :lua telescope_live_grep_in_path("./tests")<CR>
" nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>fo :Telescope file_browser<CR>
nnoremap <leader>fn :Telescope find_files<CR>
nnoremap <leader>fg :Telescope git_branches<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>FF :Telescope grep_string<CR>
" nnoremap <leader>ff : lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input("Grep For >") }<CR>

" " tpope/vim-fugitive
" nnoremap <leader>gg :G<cr>
" nnoremap <leader>gd :Gdiff master<cr>
" nnoremap <leader>gl :G log -100<cr>
" nnoremap <leader>gp :G push<cr>


" neovim/nvim-lspconfig
lua require'lspconfig'.tsserver.setup{}
" lua << EOF
" local lspconfig = require'lspconfig'
"   lspconfig.rust_analyzer.setup({
"       settings = {
"           ["rust-analyzer"] = {
"               assist = {
"                   importMergeBehavior = "last",
"                   importPrefix = "by_self",
"               },
"               cargo = {
"                   loadOutDirsFromCheck = true
"               },
"               procMacro = {
"                   enable = true
"               },
"           }
"       }
"   })
" EOF

" lua << EOF
" require'lspconfig'.nimls.setup{}
" EOF

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

" " janko/vim-test
" nnoremap <silent> tt :TestNearest<CR>
" nnoremap <silent> tf :TestFile<CR>
" nnoremap <silent> ts :TestSuite<CR>
" nnoremap <silent> t_ :TestLast<CR>
" let test#strategy = "neovim"
" let test#neovim#term_position = "vertical"
" let test#enabled_runners = ["javascript#jest"]
" let g:test#javascript#runner = 'jest'


" puremourning/vimspector
 " fun! GotoWindow(id)
 "   :call win_gotoid(a:id)
 " endfun
 " func! AddToWatch()
 "   let word = expand("<cexpr>")
 "   call vimspector#AddWatch(word)
 " endfunction
 " let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
 " let g:vimspector_sidebar_width = 60
 " nnoremap <leader>da :call vimspector#Launch()<CR>
 " nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
 " nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
 " nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
 " nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
 " nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
 " nnoremap <leader>di :call AddToWatch()<CR>
 " nnoremap <leader>dx :call vimspector#Reset()<CR>
 " nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
 " nnoremap <S-k> :call vimspector#StepOut()<CR>
 " nnoremap <S-l> :call vimspector#StepInto()<CR>
 " nnoremap <S-j> :call vimspector#StepOver()<CR>
 " nnoremap <leader>d_ :call vimspector#Restart()<CR>
 " nnoremap <leader>dn :call vimspector#Continue()<CR>
 " nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
 " nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
 " nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
 " let g:vimspector_sign_priority = {
 "   \    'vimspectorBP':         998,
 "   \    'vimspectorBPCond':     997,
 "   \    'vimspectorBPDisabled': 996,
 "   \    'vimspectorPC':         999,
 "   \ }

" " janko/vim-test and puremourning/vimspector
" nnoremap <leader>dd :TestNearest -strategy=jest<CR>
" function! JestStrategy(cmd)
 "  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
 "  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
" endfunction      
" let g:test#custom_strategies = {'jest': function('JestStrategy')}

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

nnoremap <Leader><ESC><ESC> :tabclose<CR>

" vimwiki/vimwiki
nnoremap <Leader>tl <Plug>VimwikiToggleListItem
vnoremap <Leader>tl <Plug>VimwikiToggleListItem
nnoremap <Leader>wn <Plug>VimwikiNextLink
let g:vimwiki_global_ext = 0
let wiki = {}
let wiki.nested_syntaxes = { 'js': 'javascript' }
let g:vimwiki_list = [wiki] 

" nvim/treesitter
let g:vscode_style = "dark"
colorscheme vscode
" lua << EOF
" require('github-theme').setup({
"   themeStyle = "dark"
" })
" EOF

" vhyrro/neorg
nnoremap <leader>nn :e ~/neorg/index.norg<CR>
lua << EOF
  require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.norg.concealer"] = {}, -- Allows for use of icons
                ["core.norg.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            my_workspace = "~/neorg"
                        }
                    }
                }
            },
        }
EOF

lua << EOF
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}
EOF


lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
EOF

" set foldmethod=expr
" setlocal foldlevelstart=99
" set foldexpr=nvim_treesitter#foldexpr()

" mfussenegger/nvim-dap
lua << EOF
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
EOF
nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <S-k> :lua require'dap'.step_out()<CR>
nnoremap <S-l> :lua require'dap'.step_into()<CR>
nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>ds :lua require'dap'.stop()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>dk :lua require'dap'.up()<CR>
nnoremap <leader>dj :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>
nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>

" Plug 'nvim-telescope/telescope-dap.nvim'
lua << EOF
require('telescope').setup()
require('telescope').load_extension('dap')
EOF
nnoremap <leader>df :Telescope dap frames<CR>
nnoremap <leader>dc :Telescope dap commands<CR>
nnoremap <leader>db :Telescope dap list_breakpoints<CR>

" theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
let g:dap_virtual_text = v:true

" Plug 'rcarriga/nvim-dap-ui'
" lua require("dapui").setup()
" nnoremap <leader>dq :lua require("dapui").toggle()<CR>

" jank/vim-test and mfussenegger/nvim-dap
nnoremap <leader>dd :TestNearest -strategy=jest<CR>
function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  let fileName = matchlist(a:cmd, '\v'' -- (.*)$')[1]
  call luaeval("require'debugHelper'.debugJest([[" . testName . "]], [[" . fileName . "]])")
endfunction      
let g:test#custom_strategies = {'jest': function('JestStrategy')}

" TimUntersberger/neogit and sindrets/diffview.nvim
lua << EOF
require("neogit").setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
    }
  }
EOF
nnoremap <leader>gg :Neogit<cr>
nnoremap <leader>gd :DiffviewOpen<cr>
nnoremap <leader>gD :DiffviewOpen main<cr>
nnoremap <leader>gl :Neogit log<cr>
nnoremap <leader>gp :Neogit push<cr>

" David-Kunz/jester
nnoremap <leader>tt :lua require"jester".run()<cr>
nnoremap <leader>t_ :lua require"jester".run_last()<cr>
nnoremap <leader>tf :lua require"jester".run_file()<cr>
nnoremap <leader>dd :lua require"jester".debug()<cr>
nnoremap <leader>d_ :lua require"jester".debug_last()<cr>
nnoremap <leader>dF :lua require"jester".debug_file()<cr>

" lua language server
lua << EOF
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = os.getenv('HOME') ..'/apps/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
EOF

" folke/zen-mode.nvim
lua << EOF
  require("zen-mode").setup {}
EOF
nnoremap <leader>z :ZenMode<CR>
