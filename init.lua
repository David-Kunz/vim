local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = " "

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	-- use 'kassio/neoterm'
	use 'tpope/vim-commentary'
  use 'mhartington/formatter.nvim'
	use 'neovim/nvim-lspconfig'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	-- use 'alaviss/nim.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'mfussenegger/nvim-dap'
	use 'nvim-telescope/telescope-dap.nvim'
  -- use 'nvim-telescope/telescope-file-browser.nvim'

	use 'theHamsta/nvim-dap-virtual-text'
	-- use 'Mofiqul/vscode.nvim'
  use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	-- use 'TimUntersberger/neogit'
	use 'David-Kunz/jester'
	-- use 'vhyrro/neorg'
  -- use 'junegunn/goyo.vim'
  use 'nvim-treesitter/playground'
  use 'kyazdani42/nvim-tree.lua'
  use 'David-Kunz/treesitter-unit'
  -- use 'ahmedkhalf/project.nvim'
  -- use 'tamago324/lir.nvim'
  -- use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-fugitive'
  -- use 'p00f/nvim-ts-rainbow'
  use 'sindrets/diffview.nvim'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  -- use 'shaunsingh/nord.nvim'
  use 'onsails/lspkind-nvim'
  use 'David-Kunz/cmp-npm'
  -- use 'tjdevries/colorbuddy.vim'
  -- use 'Th3Whit3Wolf/onebuddy'
  -- use 'navarasu/onedark.nvim'
  use 'marko-cerovac/material.nvim'
  -- use 'ggandor/lightspeed.nvim'
  end
)

  
-- default options
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
opt.cmdheight = 1
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = 'yes'
opt.updatetime = 520
opt.undofile = true
cmd('filetype plugin on')
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }

-- opt.path:append({ "**" })
vim.cmd([[set path=$PWD/**]])

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- local function map(mode, l, r, opts)
--       opts = opts or {}
--       opts.buffer = bufnr
--       vim.api.keymap.set(mode, l, r, opts)
-- end

map('n', '<leader>v', ':e $MYVIMRC<CR>')


-- lewis6991/gitsigns.nvim
require('gitsigns').setup({
  current_line_blame = true,
  on_attach = function(bufnr)
       -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})

-- hoob3rt/lualine.nvim
require('lualine').setup({
  options = {
    -- theme = "vscode",
    -- theme = "nord",
    theme = "material-nvim",
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {{'filename', path = 2}},
    lualine_b = {'branch', {
      'diff',
      -- color_added = 'green',
      -- color_modified = 'yellow',
      -- color_removed = 'red'
    }},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
})

-- kassio/neoterm
-- g.neoterm_default_mod = 'vertical'
-- g.neoterm_autoinsert = true
-- g.neoterm_autoscroll = true
-- g.neoterm_term_per_tab = true
-- map('n', '<c-y>', ':Ttoggle<CR>')
-- map('i', '<c-y>', '<Esc>:Ttoggle<CR>')
-- map('t', '<c-y>', '<c-\\><c-n>:Ttoggle<CR>')
-- map('n', '<leader>x', ':TREPLSendLine<CR>')
-- map('v', '<leader>x', ':TREPLSendSelection<CR>')

-- sbdchd/neoformat
map('n', '<leader>F', ':Format<CR>')
require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettierd
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
    sql = {
        -- prettierd
       function()
          return {
            exe = "sqlformat",
            args = {vim.api.nvim_buf_get_name(0), '-a'},
            stdin = true
          }
        end
    },
  }
})
local telescope_actions = require("telescope.actions.set")

local fixfolds = {
	hidden = true,
	attach_mappings = function(_)
		telescope_actions.select:enhance({
			post = function()
				vim.cmd(":normal! zx")
			end,
		})
		return true
	end,
}
-- local fb_actions = require "telescope".extensions.file_browser.actions
-- mappings in file_browser extension of telescope.setup

local actions = require("telescope.actions")


require('telescope').setup {
	pickers = {
		buffers = fixfolds,
		find_files = fixfolds,
		git_files = fixfolds,
		grep_string = fixfolds,
		live_grep = fixfolds,
		oldfiles = fixfolds,
	},
   -- extensions = {
   --  file_browser = {
   --    mappings = {
   --      ["n"] = {
   --        h = fb_actions.goto_parent_dir,
   --        l = actions.select_default
   --      }
   --    }
   --  }
  -- }
}

-- nvim-telescope/telescope.nvim
_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").find_files({search_dirs = {_path}})
end
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end
_G.telescope_files_or_git_files = function()
 local utils = require('telescope.utils')
 local builtin = require('telescope.builtin')
 local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
 if ret == 0 then
   builtin.git_files()
 else
   builtin.find_files()
 end
end
map('n', '<leader>fD', ':lua telescope_live_grep_in_path()<CR>')
map('n', '<leader><space>', ':lua telescope_files_or_git_files()<CR>')
map('n', '<leader>fd', ':lua telescope_find_files_in_path()<CR>')
map('n', '<leader>ft', ':lua telescope_find_files_in_path("./tests")<CR>')
map('n', '<leader>fT', ':lua telescope_live_grep_in_path("./tests")<CR>')
map('n', '<leader>ff', ':Telescope live_grep<CR>')
-- map('n', '<leader>fo', ':Telescope file_browser<CR>')
map('n', '<leader>fn', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope git_branches<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>ff', ':Telescope live_grep<CR>')
map('n', '<leader>FF', ':Telescope grep_string<CR>')

-- without cmp:
-- local nvim_lsp = require'lspconfig'
-- local on_attach = function(client, bufnr)
--     local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--     buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- end
-- local servers = { 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach
--   }
-- end


-- David-Kunz/cmp-npm
require('cmp-npm').setup({ ignore = {"beta", "rc"} })

-- hrsh7th/nvim-cmp
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'npm' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer', keyword_length = 5 },
  },
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
})

local nvim_lsp = require'lspconfig'
local servers = { 'tsserver', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end

-- hrsh7th/vim-vsnip
vim.cmd([[
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])

-- nvim_lsp.tsserver.setup{ on_attach = on_attach }
-- nvim_lsp.rust_analyzer.setup({
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 importGranularity = "module",
--                 importPrefix = "by_self",
--             },
--             cargo = {
--                 loadOutDirsFromCheck = true
--             },
--             procMacro = {
--                 enable = true
--             },
--         }
--     }
-- })
--require'lspconfig'.nimls.setup{}

map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>')
map('n', 'ga', ':Telescope lsp_code_actions<CR>')
map('n', 'gA', ':Telescope lsp_range_code_actions<CR>')
map('n', 'gD', ':lua vim.lsp.buf.implementation()<CR>')
map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
map('n', 'gR', ':lua vim.lsp.buf.rename()<CR>')
 
-- CDS
-- cmd([[
-- augroup MyCDSCode
--      autocmd!
--      autocmd BufReadPre,FileReadPre *.cds set ft=cds
-- augroup END
-- ]])
-- local lspconfig = require'lspconfig'
-- local configs = require'lspconfig.configs'
-- if not configs.sapcds_lsp then
--   configs.sapcds_lsp = {
--     default_config = {
--       cmd = {vim.fn.expand("$HOME/projects/startcdslsp")};
--       filetypes = {'cds'};
--       root_dir = lspconfig.util.root_pattern('.git', 'package.json'),
--       settings = {};
--     };
--   }
-- end
-- if lspconfig.sapcds_lsp.setup then
--   lspconfig.sapcds_lsp.setup{
--     -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--   }
-- end

map('n', '<leader><esc><esc>', ':tabclose<CR>')

-- nvim/treesitter
-- g.vscode_style = "dark"
-- cmd('colorscheme vscode')
-- g.nord_contrast = true
-- g.nord_borders = true
-- cmd('colorscheme nord')
-- require('colorbuddy').colorscheme('onebuddy')
vim.cmd 'colorscheme material'

cmd('set foldmethod=expr')
cmd('set foldexpr=nvim_treesitter#foldexpr()')

map('n', '<leader>n', ':tabe ~/tmp/notes.md<CR>')

-- -- vhyrro/neorg
-- map('n', '<leader>nn', ':e ~/neorg/index.norg<CR>')
-- require('neorg').setup {
--           -- Tell Neorg what modules to load
--           load = {
--               ["core.defaults"] = {}, -- Load all the default modules
--               ["core.norg.concealer"] = {}, -- Allows for use of icons
--               ["core.norg.dirman"] = { -- Manage your directories with Neorg
--                   config = {
--                       workspaces = {
--                           my_workspace = "~/neorg"
--                       }
--                   }
--               }
--           },
--       }
-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- parser_configs.norg = {
--     install_info = {
--         url = "https://github.com/vhyrro/tree-sitter-norg",
--         files = { "src/parser.c" },
--         branch = "main"
--     },
-- }

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.cds = {
      install_info = {
            -- local path or git repo
            url = "~/apps/tree-sitter-cds",
            files = { "src/parser.c", "src/scanner.c" }
      },
      filetype = "cds",
      -- additional filetypes that use this parser
      used_by = { "cdl", "hdbcds" }
    }

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  -- indent = {
  --   enable = true
  -- },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  }
}
-- mfussenegger/nvim-dap
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/node/out/src/nodeDebug.js'},
}
-- require('dap').set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

-- _G.shutDownDapSession = function()
--   local dap = require'dap'
--   dap.terminate()
--   dap.disconnect( { terminateDebuggee = true })
--   dap.close()
-- end

map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map('n', '<c-k>', ':lua require"dap".step_out()<CR>')
map('n', "<c-l>", ':lua require"dap".step_into()<CR>')
map('n', '<c-j>', ':lua require"dap".step_over()<CR>')
map('n', '<c-h>', ':lua require"dap".continue()<CR>')
map('n', '<leader>dn', ':lua require"dap".run_to_cursor()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')
map('n', '<leader>dc', ':lua require"dap".terminate()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map('n', '<leader>dR', ':lua require"dap".clear_breakpoints()<CR>')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
map('n', '<leader>ds', ':Telescope dap frames<CR>')
-- map('n', '<leader>dc', ':Telescope dap commands<CR>')
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

-- nvim-telescope/telescope-file-browser.nvim
-- require('telescope').load_extension('file_browser')
-- theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
require('nvim-dap-virtual-text').setup()
-- g.dap_virtual_text = true

-- -- -- TimUntersberger/neogit and sindrets/diffview.nvim
-- require'diffview'.setup {
--   file_panel = {
--     position = "left",            -- One of 'left', 'right', 'top', 'bottom'
--     width = 60,                   -- Only applies when position is 'left' or 'right'
--   }
-- }
-- require("neogit").setup {
--   disable_commit_confirmation = true,
--   integrations = {
--     diffview = true
--     }
--   }
-- map('n', '<leader>gg', ':Neogit<cr>')
-- map('n', '<leader>gd', ':DiffviewOpen<cr>')
-- map('n', '<leader>gD', ':DiffviewOpen main<cr>')
-- map('n', '<leader>gl', ':Neogit log<cr>')
-- map('n', '<leader>gp', ':Neogit push<cr>')

-- 'tpope/vim-fugitive'
map('n', '<leader>gg', ':G<cr>')
map('n', '<leader>gc', ':G commit<cr>')
map('n', '<leader>gd', ':tabe %<cr>:Gvdiffsplit!<CR>')
map('n', '<leader>gD', ':DiffviewOpen<cr>')
map('n', '<leader>gm', ':tabe %<cr>:Gvdiffsplit! main<CR>')
map('n', '<leader>gM', ':DiffviewOpen main<cr>')
map('n', '<leader>gl', ':Git log<cr>')
map('n', '<leader>gp', ':Git push<cr>')

-- David-Kunz/jester
map('n', '<leader>tt', ':lua require"jester".run({ path_to_jest = "/usr/local/bin/jest" })<cr>')
map('n', '<leader>t_', ':lua require"jester".run_last({ path_to_jest = "/usr/local/bin/jest" })<cr>')
map('n', '<leader>tf', ':lua require"jester".run_file({ path_to_jest = "/usr/local/bin/jest" })<cr>')
map('n', '<leader>dd', ':lua require"jester".debug({ path_to_jest = "/usr/local/bin/jest" })<cr>')
map('n', '<leader>d_', ':lua require"jester".debug_last({ path_to_jest = "/usr/local/bin/jest" })<cr>')
map('n', '<leader>df', ':lua require"jester".debug_file({ path_to_jest = "/usr/local/bin/jest" })<cr>')

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
   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
-- require("zen-mode").setup {
--   window = { width = .40 }
-- }
-- map('n', '<leader>z', ':ZenMode<CR>')

-- junegunn/goyo.vim
g.goyo_width = 120
-- map('n', '<leader>z', ':Goyo<CR>')


map('n', '[b', ':bnext<CR>')
map('n', ']b', ':bprev<CR>')

-- ahmedkhalf/project.nvim
-- require("project_nvim").setup()
-- require('telescope').load_extension('projects')

-- map('n', '<leader>fp', ':Telescope projects<CR>')

-- map('n', '<c-p>', ':NvimTreeToggle<CR>')
-- g.nvim_tree_follow = 1
-- g.nvim_tree_auto_resize = 1

-- David-Kunz/treesitter-unit
map('x', 'u', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
map('o', 'u', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
-- require"treesitter-unit".enable_highlighting()

-- tamago324/lir.nvim
-- local actions = require'lir.actions'
-- local mark_actions = require 'lir.mark.actions'
-- local clipboard_actions = require'lir.clipboard.actions'

-- require'lir'.setup {
--   show_hidden_files = false,
--   devicons_enable = true,
--   mappings = {
--     ['l']     = actions.edit,
--     ['<C-s>'] = actions.split,
--     ['<C-v>'] = actions.vsplit,
--     ['<C-t>'] = actions.tabedit,

--     ['h']     = actions.up,
--     ['q']     = actions.quit,

--     ['K']     = actions.mkdir,
--     ['N']     = actions.newfile,
--     ['R']     = actions.rename,
--     ['@']     = actions.cd,
--     ['Y']     = actions.yank_path,
--     ['.']     = actions.toggle_show_hidden,
--     ['D']     = actions.delete,

--     ['J'] = function()
--       mark_actions.toggle_mark()
--       vim.cmd('normal! j')
--     end,
--     ['C'] = clipboard_actions.copy,
--     ['X'] = clipboard_actions.cut,
--     ['P'] = clipboard_actions.paste,
--   },
--   float = {
--     winblend = 0,

--     -- -- You can define a function that returns a table to be passed as the third
--     -- -- argument of nvim_open_win().
--     -- win_opts = function()
--     --   local width = math.floor(vim.o.columns * 0.8)
--     --   local height = math.floor(vim.o.lines * 0.8)
--     --   return {
--     --     border = require("lir.float.helper").make_border_opts({
--     --       "+", "─", "+", "│", "+", "─", "+", "│",
--     --     }, "Normal"),
--     --     width = width,
--     --     height = height,
--     --     row = 1,
--     --     col = math.floor((vim.o.columns - width) / 2),
--     --   }
--     -- end,
--   },
-- }

-- custom folder icon
require'nvim-web-devicons'.setup({
  override = {
    lir_folder_icon = {
      icon = "",
      color = "#7ebae4",
      name = "LirFolderNode"
    },
  }
})
-- use visual mode
function _G.LirSettings()
  vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

  -- echo cwd
  vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end
vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]

-- global mark I for last edit
vim.cmd [[autocmd InsertLeave * execute 'normal! mI']]

-- highlight on yank
vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

-- kyazdani42/nvim-tree.lua
require('nvim-tree').setup({
  hijack_cursor = true,
  update_focused_file = { enable = true },
  view = {
    width = 60
  }
})
map('n', '\\', ':NvimTreeToggle<CR>', {silent=true})

map('n', 'gq', ':q<CR>')
map('n', '<leader>w', ':w<CR>')

vim.cmd('iabbrev :tup: 👍')
vim.cmd('iabbrev :tdo: 👎')
vim.cmd('iabbrev :smi: 😊')
vim.cmd('iabbrev :sad: 😔')
vim.cmd('iabbrev darkred #8b0000')
vim.cmd('iabbrev darkgreen #006400')

-- p00f/nvim-ts-rainbow
-- require'nvim-treesitter.configs'.setup {
--   rainbow = {
--     enable = true,
--     extended_mode = true,
--     max_file_lines = nil
--   }
-- }

-- map('n', '<s-k>', ':lua require"tree-mover".up()<CR>')
-- map('n', '<s-j>', ':lua require"tree-mover".down()<CR>')
-- map('n', '<s-l>', ':lua require"tree-mover".right()<CR>')
-- map('n', '<s-h>', ':lua require"tree-mover".left()<CR>')
-- map('n', '<s-y>', ':lua require"tree-mover".current()<CR>')


_G.term_buf_of_tab = _G.term_buf_of_tab or {}
_G.term_buf_max_nmb = _G.term_buf_max_nmb or 0
_G.toggle_terminal = function()
  local cur_tab = vim.api.nvim_get_current_tabpage()
  local term_buf = term_buf_of_tab[cur_tab]
  if term_buf ~= nil then
   local cur_buf = vim.api.nvim_get_current_buf()
   if cur_buf == term_buf then
     vim.cmd('q')
   else
     vim.cmd('vert sb' .. term_buf)
     vim.cmd(':startinsert')
   end
  else
    vim.cmd('vs | terminal')
    local cur_buf = vim.api.nvim_get_current_buf()
    _G.term_buf_max_nmb = _G.term_buf_max_nmb + 1
    vim.api.nvim_buf_set_name(cur_buf, "Terminal " .. _G.term_buf_max_nmb)
    table.insert(term_buf_of_tab, cur_tab, cur_buf)
    vim.cmd(':startinsert')
  end
end
map('n', '<c-y>', ':lua toggle_terminal()<CR>')
map('i', '<c-y>', '<ESC>:lua toggle_terminal()<CR>')
map('t', '<c-y>', '<c-\\><c-n>:lua toggle_terminal()<CR>')
cmd([[
if has('nvim')
   au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif]])

local someNs = vim.api.nvim_create_namespace('bla')
_G.exampleVirtualLine = function() 
  vim.api.nvim_buf_set_extmark(0, someNs, 2, 0, { virt_lines = { { { "This is an example virtual line", "CursorLine" } } } })
end

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
  }
}

map('n', '<c-o>', '<c-o>zz')
map('n', '<c-i>', '<c-i>zz')


-- -- TimUntersberger/neogit
-- local neogit = require('neogit')
-- neogit.setup {
--   disable_commit_confirmation = true,
--   disable_signs = true,
--   auto_refresh = false,
--   disable_builtin_notifications = true,
--   integrations = {
--     diffview = true
--   }
-- }
-- map('n', '<leader>gg', ':Neogit<cr>')
