local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

g.mapleader = " "

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use 'szw/vim-maximizer'
	use 'kassio/neoterm'
	use 'tpope/vim-commentary'
	use 'sbdchd/neoformat'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
	use 'vimwiki/vimwiki'
	use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'alaviss/nim.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'mfussenegger/nvim-dap'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'Mofiqul/vscode.nvim'
	use 'hoob3rt/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	use 'TimUntersberger/neogit'
	use 'sindrets/diffview.nvim'
	use 'projekt0n/github-nvim-theme'
	use 'David-Kunz/jester'
	use 'vhyrro/neorg'
	use 'folke/zen-mode.nvim'
end)

--  
-- " default options
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
-- set diffopt+=vertical " starts diff mode in vertical split
opt.hidden = true
opt.cmdheight = 1
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = 'yes'
opt.updatetime = 520
opt.undofile = true
cmd('filetype plugin indent on')
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }


local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>v', ':e $MYVIMRC<CR>')

-- lewis6991/gitsigns.nvim
require('gitsigns').setup({})

-- hoob3rt/lualine.nvim
require('lualine').setup({
  options = {
    theme = "vscode",
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {{'filename', path = 1}},
    lualine_b = {'branch', {
      'diff',
      color_added = 'green',
      color_modified = 'yellow',
      color_removed = 'red'
    }},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
})

-- szw/vim-maximizer
map('', '<C-w>m', ':MaximizerToggle!<CR>')

-- kassio/neoterm
g.neoterm_default_mod = 'vertical'
g.neoterm_autoinsert = true
g.neoterm_autoscroll = true
g.neoterm_term_per_tab = true
map('n', '<c-y>', ':Ttoggle<CR>')
map('i', '<c-y>', ':Ttoggle<CR>')
map('t', '<c-y>', '<c-\\><c-n>:Ttoggle<CR>')
map('n', '<leader>x', ':TREPLSendLine<CR>')
map('v', '<leader>x', ':TREPLSendSelection<CR>')
cmd([[
if has('nvim')
   au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif]])

-- sbdchd/neoformat
map('n', '<leader>F', ':Neoformat prettier<CR>')

-- nvim-telescope/telescope.nvim
_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").find_files({search_dirs = {_path}})
end
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end
map('n', '<leader><space>', ':Telescope git_files<CR>')
map('n', '<leader>fd', ':lua telescope_find_files_in_path()<CR>')
map('n', '<leader>fD', ':lua telescope_live_grep_in_path()<CR>')
map('n', '<leader>ft', ':lua telescope_find_files_in_path("./tests")<CR>')
map('n', '<leader>fT', ':lua telescope_live_grep_in_path("./tests")<CR>')
map('n', '<leader>ff', ':Telescope live_grep<CR>')
map('n', '<leader>fo', ':Telescope file_browser<CR>')
map('n', '<leader>fn', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope git_branches<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>ff', ':Telescope live_grep<CR>')
map('n', '<leader>FF', ':Telescope grep_string<CR>')
map('n', '<leader>fs', ':Telescope git_status<CR>')

-- neovim/nvim-lspconfig
local nvim_lsp = require'lspconfig'
nvim_lsp.tsserver.setup{}
nvim_lsp.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
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
--require'lspconfig'.nimls.setup{}

map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>')
map('n', 'ga', ':Telescope lsp_code_actions<CR>')
map('n', 'gA', ':Telescope lsp_range_code_actions<CR>')
map('n', 'gD', ':lua vim.lsp.buf.implementation()<CR>')
map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
map('n', 'gR', ':lua vim.lsp.buf.rename()<CR>')
 
-- hrsh7th/nvim-compe
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
vim.cmd('inoremap <silent><expr> <c-space> compe#complete()', { silent = true, expr = true } )

-- CDS
cmd([[
augroup MyCDSCode
     autocmd!
     autocmd BufReadPre,FileReadPre *.cds set ft=cds
augroup END
]])
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

map('n', '<leader><esc><esc>', ':tabclose<CR>')

-- nvim/treesitter
g.vscode_style = "dark"
cmd('colorscheme vscode')

-- vhyrro/neorg
map('n', '<leader>nn', ':e ~/neorg/index.norg<CR>')
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
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner"
      }
    }
  }
}
-- mfussenegger/nvim-dap
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<c-k>', ':lua require"dap".step_out()<CR>')
map('n', '<c-l>', ':lua require"dap".step_into()<CR>')
map('n', '<c-j>', ':lua require"dap".step_over()<CR>')
map('n', '<c-h>', ':lua require"dap".continue()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')
map('n', '<leader>d_', ':lua require"dap".disconnect();require"dap".stop();require"dap".run_last()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.open({}, "vsplit")<CR><C-w>l')
map('n', '<leader>di', ':lua require"dap.ui.variables".hover()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.variables".visual_hover()<CR>')
map('n', '<leader>d?', ':lua require"dap.ui.variables".scopes()<CR>')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
map('n', '<leader>ds', ':Telescope dap frames<CR>')
map('n', '<leader>dc', ':Telescope dap commands<CR>')
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

-- theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
g.dap_virtual_text = true

-- TimUntersberger/neogit and sindrets/diffview.nvim
require("neogit").setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
    }
  }
map('n', '<leader>gg', ':Neogit<cr>')
map('n', '<leader>gd', ':DiffviewOpen<cr>')
map('n', '<leader>gD', ':DiffviewOpen main<cr>')
map('n', '<leader>gl', ':Neogit log<cr>')
map('n', '<leader>gp', ':Neogit push<cr>')

-- David-Kunz/jester
map('n', '<leader>tt', ':lua require"jester".run()<cr>')
map('n', '<leader>t_', ':lua require"jester".run_last()<cr>')
map('n', '<leader>tf', ':lua require"jester".run_file()<cr>')
map('n', '<leader>dd', ':lua require"jester".debug()<cr>')
map('n', '<leader>d_', ':lua require"jester".debug_last()<cr>')
map('n', '<leader>df', ':lua require"jester".debug_file()<cr>')

-- lua language server
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

-- folke/zen-mode.nvim
require("zen-mode").setup {
  window = { width = .40 }
}
map('n', '<leader>z', ':ZenMode<CR>')

-- map('n', '<c-j>', ':bnext<CR>')
-- map('n', '<c-k>', ':bprev<CR>')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('n', 'Y', "y$")
