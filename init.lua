-- vim.cmd("set shell=/bin/zsh")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "--single-branch",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.runtimepath:prepend(lazypath)

local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = " "

require('lazy').setup({
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                styles = {functions = 'bold', keywords = 'italic'}
            })
            vim.cmd.colorscheme("tokyonight")
            -- vim.cmd.colorscheme("tokyonight-day")
        end
    },
    'mhartington/formatter.nvim', -- use 'neovim/nvim-lspconfig',
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    'nvim-telescope/telescope.nvim',
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension "frecency"
        end,
        dependencies = {"kkharji/sqlite.lua"}
    },
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'lewis6991/gitsigns.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',
    'ryanoasis/vim-devicons',
    'David-Kunz/jester',
    {'David-Kunz/gen.nvim', dev = true},
    -- {'David-Kunz/markid', dev = true},
    -- 'David-Kunz/spotlight',
    {'nvim-tree/nvim-tree.lua', dependencies = {'nvim-tree/nvim-web-devicons'}},
    -- {'echasnovski/mini.base16', version = '*'}
    'David-Kunz/treesitter-unit', -- use 'David-Kunz/ts-quickfix',
    -- 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/nvim-cmp',
    -- 'David-Kunz/cmp-npm', 'marko-cerovac/material.nvim',
    'mfussenegger/nvim-dap', -- 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
    'voldikss/vim-floaterm',
    'rcarriga/nvim-dap-ui',
    -- use 'ldelossa/litee.nvim',
    -- use 'ldelossa/gh.nvim',
    'nvim-telescope/telescope-ui-select.nvim', -- 'nvim-treesitter/playground',
    -- 'norcalli/nvim-colorizer.lua', 
    'mxsdev/nvim-dap-vscode-js',
    "microsoft/vscode-js-debug",
    -- lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
    {
        "microsoft/vscode-node-debug2",
        -- lazy = true,
        build = "npm install && NODE_OPTIONS=--no-experimental-fetch npm run build"
    }, -- use {
    --     'ggandor/leap.nvim',
    --     config = function() require('leap').add_default_mappings() end
    -- }
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        'echasnovski/mini.completion',
        version = false,
        config = function() require('mini.completion').setup() end
    },
    {
        'echasnovski/mini.comment',
        version = false,
        config = function() require('mini.comment').setup() end
    },
    {
        'echasnovski/mini.files',
        version = false,
        config = function()
            require('mini.files').setup({mappings = {go_in_plus = 'l'}})
        end

    }
    -- {
    --     'echasnovski/mini.base16',
    --     version = false,
    --     config = function()
    --         require('mini.base16').setup({
    --             palette = {
    --                 base00 = "#181818",
    --                 base01 = "#282828",
    --                 base02 = "#383838",
    --                 base03 = "#585858",
    --                 base04 = "#b8b8b8",
    --                 base05 = "#d8d8d8",
    --                 base06 = "#e8e8e8",
    --                 base07 = "#f8f8f8",
    --                 base08 = "#ab4642",
    --                 base09 = "#dc9656",
    --                 base0A = "#f7ca88",
    --                 base0B = "#a1b56c",
    --                 base0C = "#86c1b9",
    --                 base0D = "#7cafc2",
    --                 base0E = "#ba8baf",
    --                 base0F = "#a16946"
    --             }
    --         })
    --     end
    -- }
    -- {
    --     'Exafunction/codeium.vim',
    -- }
}, {dev = {path = "/Users/d065023/projects/nvim"}})

-- vim.g.codeium_enabled = false
-- vim.g.codeium_disable_bindings = true
-- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
-- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
-- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
-- vim.keymap.set('i', '<c-cr>', function() return vim.fn['codeium#Accept']() end, { expr = true })
-- require('packer').startup(function(use)end)
--     use 'wbthomason/packer.nvim'
--     use 'tpope/vim-commentary'
--     use 'mhartington/formatter.nvim'
--     -- use 'neovim/nvim-lspconfig'
--     use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
--     use 'nvim-telescope/telescope.nvim'
--     use 'nvim-lua/plenary.nvim'
--     use 'nvim-lua/popup.nvim'
--     use 'lewis6991/gitsigns.nvim'
--     use 'nvim-telescope/telescope-dap.nvim'
--     use 'theHamsta/nvim-dap-virtual-text'
--     use 'ryanoasis/vim-devicons'
--     use 'David-Kunz/jester'
--     use 'David-Kunz/markid'
--     use 'David-Kunz/spotlight'
--     use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}}
--     use 'David-Kunz/treesitter-unit'
--     -- use 'David-Kunz/ts-quickfix'
--     use 'hrsh7th/cmp-nvim-lsp'
--     use 'hrsh7th/cmp-buffer'
--     use 'hrsh7th/nvim-cmp'
--     use 'David-Kunz/cmp-npm'
--     use 'marko-cerovac/material.nvim'
--     use 'mfussenegger/nvim-dap'
--     use 'L3MON4D3/LuaSnip'
--     use 'saadparwaiz1/cmp_luasnip'
--     use 'voldikss/vim-floaterm'
--     use 'rcarriga/nvim-dap-ui'
--     -- use 'ldelossa/litee.nvim'
--     -- use 'ldelossa/gh.nvim'
--     use 'nvim-telescope/telescope-ui-select.nvim'
--     use 'folke/tokyonight.nvim'
--     use 'nvim-treesitter/playground'
--     use 'norcalli/nvim-colorizer.lua'
--     use 'mxsdev/nvim-dap-vscode-js'
--     use {
--         "microsoft/vscode-js-debug",
--         opt = true,
--         run = "npm install --legacy-peer-deps && npm run compile"
--     }
--     use {
--         "microsoft/vscode-node-debug2",
--         opt = true,
--         run = "npm install && NODE_OPTIONS=--no-experimental-fetch npm run build"
--     }
--     -- use {
--     --     'ggandor/leap.nvim',
--     --     config = function() require('leap').add_default_mappings() end
--     -- }
--     use {
--         "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
--         "neovim/nvim-lspconfig"
--     }
-- end)

-- default options
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.laststatus = 3
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
opt.so = 10
-- opt.relativenumber = true
vim.cmd('set nonumber')
vim.cmd('set norelativenumber')
-- set diffopt+=vertical " starts diff mode in vertical split
opt.cmdheight = 1
opt.ls = 0
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = 'yes'
opt.updatetime = 520
opt.undofile = true
cmd('filetype plugin on')
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = {'javascript', 'js=javascript', 'json=javascript'}

-- opt.path:append({ "**" })
vim.cmd([[set path=$PWD/**]])
vim.keymap.set('n', '<leader>v', ':e $MYVIMRC<CR>')

vim.opt.statusline = "%F Line:%l"

-- lewis6991/gitsigns.nvim
function diffThisBranch()
    local branch = vim.fn.input("Branch: ", "")
    require"gitsigns".diffthis(branch)
end

require('gitsigns').setup({
    current_line_blame = true,
    on_attach = function(bufnr)
        -- Navigation
        -- vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
        -- vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
        vim.keymap.set('n', ']c', ':Gitsigns next_hunk<CR>')
        vim.keymap.set('n', '[c', ':Gitsigns prev_hunk<CR>')

        -- Actions
        vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        vim.keymap.set('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        vim.keymap.set('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
        vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
        vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
        vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
        vim.keymap.set('n', '<leader>hb', function()
            require"gitsigns".blame_line {full = true}
        end)
        vim.keymap.set('n', '<leader>tb',
                       '<cmd>Gitsigns toggle_current_line_blame<CR>')
        vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
        vim.keymap.set('n', '<leader>hD',
                       function() require"gitsigns".diffthis("~") end)
        vim.keymap.set('n', '<leader>hm',
                       function() require"gitsigns".diffthis("main") end)
        vim.keymap.set('n', '<leader>hM', diffThisBranch)
        vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

        -- Text object
        vim.keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        vim.keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
})

-- sbdchd/neoformat
vim.keymap.set('n', '<leader>F', ':Format<CR>')
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
        typescript = {
            -- prettierd
            function()
                return {
                    exe = "prettierd",
                    args = {vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        json = {
            -- prettierd
            function()
                return {
                    exe = "prettierd",
                    args = {vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        rust = {function() return {exe = "rustfmt", stdin = true} end},
        lua = {function() return {exe = "lua-format", stdin = true} end},
        sql = {
            -- prettierd
            function()
                return {
                    exe = "sql-formatter",
                    args = {vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        }
    }
})
local telescope_actions = require("telescope.actions.set")

local fixfolds = {
    hidden = true,
    attach_mappings = function(_)
        telescope_actions.select:enhance({
            post = function() vim.cmd(":normal! zx") end
        })
        return true
    end
}

local actions = require("telescope.actions")

require('telescope').setup {
    pickers = {
        buffers = fixfolds,
        find_files = fixfolds,
        git_files = fixfolds,
        grep_string = fixfolds,
        live_grep = fixfolds,
        oldfiles = fixfolds
    }
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
    local _, ret, _ = utils.get_os_command_output({
        'git', 'rev-parse', '--is-inside-work-tree'
    })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end
vim.keymap.set('n', '<leader>fD', function() telescope_live_grep_in_path() end)
-- vim.keymap.set('n', '<leader><space>',
--                function() telescope_files_or_git_files() end)
vim.keymap.set('n', '<leader>fd', function() telescope_find_files_in_path() end)
vim.keymap.set('n', '<leader>ft',
               function() telescope_find_files_in_path("./tests") end)
vim.keymap.set('n', '<leader>fc', function()
    telescope_find_files_in_path("./node_modules/@sap/cds")
end)
vim.keymap.set('n', '<leader>fC', function()
    telescope_live_grep_in_path("./node_modules/@sap/cds")
end)
vim.keymap.set('n', '<leader>fT',
               function() telescope_live_grep_in_path("./tests") end)
vim.keymap.set('n', '<leader>ff', ':Telescope live_grep<CR>')
-- vim.keymap.set('n', '<leader>fo', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<leader>fn', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fr', ':Telescope resume<CR>')
vim.keymap.set('n', '<leader>fG', ':Telescope git_branches<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope git_status<CR>')
vim.keymap.set('n', '<c-\\>', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
vim.keymap.set('n', '<leader>FF', ':Telescope grep_string<CR>')
vim.keymap.set('n', '<leader><space>', ':Telescope frecency workspace=CWD<CR>')

vim.keymap.set('n', '<leader>fy', ':let @"=expand("%")<CR>')
-- David-Kunz/cmp-npm
-- require('cmp-npm').setup({only_latest_version = true})

vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end)
vim.keymap.set('n', 'gh', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', 'gD', function() vim.lsp.buf.implementation() end)
vim.keymap.set('n', '<c-k>', function() vim.lsp.buf.signature_help() end)
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end)
vim.keymap.set('n', 'gR', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', 'ga', function() vim.lsp.buf.code_action() end)
vim.keymap.set('n', 'ge', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', 'gE', function() vim.diagnostic.goto_prev() end)
vim.keymap.set('n', 'gA', ':Telescope lsp_range_code_actions<CR>')

-- -- CDS
-- cmd([[
-- augroup MyCDSCode
--      autocmd!
--      autocmd BufReadPre,FileReadPre *.cds set ft=cds
-- augroup END
-- ]])
--
-- DISABLE FOR NOW
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
if not configs.sapcds_lsp then
    configs.sapcds_lsp = {
        default_config = {
            cmd = {
                vim.fn.expand(
                    "/Users/d065023/apps/cds-lsp/node_modules/.bin/cds-lsp"),
                '--stdio'
            },
            filetypes = {'cds'},
            root_dir = lspconfig.util.root_pattern('.git', 'package.json'),
            settings = {}
        }
    }
end
if lspconfig.sapcds_lsp.setup then
    lspconfig.sapcds_lsp.setup {
        -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
end

vim.keymap.set('n', '<leader><esc><esc>', ':tabclose<CR>')

-- vim.g.material_style = "darker"
-- vim.cmd 'colorscheme material'
vim.opt.fillchars = {
    horiz = '█',
    horizup = '█',
    horizdown = '█',
    vert = '█',
    vertleft = '█',
    vertright = '█',
    verthoriz = '█'
}

vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95
vim.keymap.set('n', '<leader>g', ':FloatermNew lazygit<CR>')

-- cmd('set foldmethod=expr')
-- cmd('set foldexpr=nvim_treesitter#foldexpr()')

-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.keymap.set('n', '<leader>n', ':tabe ~/tmp/notes.md<CR>')

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.cds = {
    install_info = {
        -- local path or git repo
        -- url = "~/apps/tree-sitter-cds",
        url = "/Users/d065023/apps/tree-sitter-cds",
        files = {"src/parser.c", "src/scanner.c"}
    },
    filetype = "cds",
    -- additional filetypes that use this parser
    used_by = {"cdl", "hdbcds"}
}

-- require('markid')
require'nvim-treesitter.configs'.setup {
    highlight = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<S-CR>'
        }
    }
    -- markid = {enable = true}
}

-- mxsdev/nvim-dap-vscode-js
require('dap-vscode-js').setup({
    debugger_path = os.getenv('HOME') ..
        '/.local/share/nvim/lazy/vscode-js-debug',
    adapters = {
        'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal',
        'pwa-extensionHost'
    }
})
-- require("dap-vscode-js").setup({
--     adapters = {
--         'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal',
--         'pwa-extensionHost'
--     }
-- })

-- mfussenegger/nvim-dap
local dap = require('dap')
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {
        os.getenv('HOME') ..
            '/.local/share/nvim/lazy/vscode-node-debug2/out/src/nodeDebug.js'
    }
}

-- require('dap').set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = '20split new'
vim.fn.sign_define('DapBreakpoint',
                   {text = '🟥', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected',
                   {text = '🟦', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',
                   {text = '⭐️', texthl = '', linehl = '', numhl = ''})

vim.keymap.set('n', '<leader>dh',
               function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dH',
               ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set({'n', 't'}, '<A-k>', function() require"dap".step_out() end)
vim.keymap.set({'n', 't'}, "<A-l>", function() require"dap".step_into() end)
vim.keymap.set({'n', 't'}, '<A-j>', function() require"dap".step_over() end)
vim.keymap.set({'n', 't'}, '<A-h>', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>dc', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>dR',
               function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>de',
               function() require"dap".set_exception_breakpoints({"all"}) end)
vim.keymap.set('n', '<leader>da', function() require"debugHelper".attach() end)
vim.keymap.set('n', '<leader>dA',
               function() require"debugHelper".attachToRemote() end)
vim.keymap
    .set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>d?', function()
    local widgets = require "dap.ui.widgets";
    widgets.centered_float(widgets.scopes)
end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dr',
               ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
vim.keymap.set('n', '<leader>du', ':lua require"dapui".toggle()<CR>')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
vim.keymap.set('n', '<leader>ds', ':Telescope dap frames<CR>')
-- vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
vim.keymap.set('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

require('nvim-dap-virtual-text').setup()

-- David-Kunz/jester
require'jester'.setup({
    path_to_jest = "/opt/homebrew/bin/jest",
    dap = {type = 'pwa-node'}
})
-- require'jester'.setup({ dap = { type = 'pwa-node'}})
-- require'jester'.setup({ path_to_jest = "/opt/homebrew/bin/jest", dap = { type = 'pwa-node' } })
vim.keymap.set('n', '<leader>tt', function() require"jester".run() end)
vim.keymap.set('n', '<leader>t_', function() require"jester".run_last() end)
vim.keymap.set('n', '<leader>tf', function() require"jester".run_file() end)
vim.keymap.set('n', '<leader>d_', function() require"jester".debug_last() end)
vim.keymap.set('n', '<leader>df', function() require"jester".debug_file() end)
vim.keymap.set('n', '<leader>dq', function() require"jester".terminate() end)
vim.keymap.set('n', '<leader>dd', function() require"jester".debug() end)

-- lua language server
-- local system_name
-- if vim.fn.has("mac") == 1 then
--   system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
--   system_name = "Linux"
-- elseif vim.fn.has('win32') == 1 then
--   system_name = "Windows"
-- else
--   print("Unsupported system for sumneko")
-- end

-- -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = os.getenv('HOME') ..'/apps/lua-language-server'
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

-- require'lspconfig'.sumneko_lua.setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

-- vim.keymap.set('n', '[b', ':bnext<CR>')
-- vim.keymap.set('n', ']b', ':bprev<CR>')

-- David-Kunz/treesitter-unit
vim.keymap.set('x', 'u', ':<c-u>lua require"treesitter-unit".select()<CR>')
vim.keymap.set('o', 'u', ':<c-u>lua require"treesitter-unit".select()<CR>')
vim.keymap.set('x', 'u', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
vim.keymap.set('o', 'u', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
-- require"treesitter-unit".enable_highlighting()

-- local tunit = require'treesitter-unit'
-- vim.keymap.set('x', 'iu', function() require'treesitter-unit'.select() end)
-- vim.keymap.set('x', 'au', function() require'treesitter-unit'.select(true) end)
-- vim.keymap.set('o', 'iu', function() require'treesitter-unit'.select() end)
-- vim.keymap.set('o', 'au', function() require'treesitter-unit'.select(true) end)

-- custom folder icon
require'nvim-web-devicons'.setup({
    override = {
        lir_folder_icon = {
            icon = "",
            color = "#7ebae4",
            name = "LirFolderNode"
        }
    }
})
-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J',
                                ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
                                {noremap = true, silent = true})

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
vim.cmd(
    [[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

-- kyazdani42/nvim-tree.lua
-- require('nvim-tree').setup({
--     hijack_cursor = true,
--     update_focused_file = {enable = true},
--     filters = {dotfiles = true},
--     view = {width = 50}
-- })
-- vim.keymap.set('n', '\\', ':NvimTreeToggle<CR>', {silent = true})
vim.keymap.set('n', '\\',
               ':lua if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0)) end<CR>',
               {silent = true})

vim.keymap.set('n', 'gq', ':bd!<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.cmd('iabbrev :tup: 👍')
vim.cmd('iabbrev :tdo: 👎')
vim.cmd('iabbrev :smi: 😊')
vim.cmd('iabbrev :sad: 😔')
vim.cmd('iabbrev darkred #8b0000')
vim.cmd('iabbrev darkgreen #006400')


_G.term_buf_of_tab = _G.term_buf_of_tab or {}
_G.term_buf_max_nmb = _G.term_buf_max_nmb or 0

local function spawn_terminal()
    local cur_tab = vim.api.nvim_get_current_tabpage()
    vim.cmd('vs | terminal')
    local cur_buf = vim.api.nvim_get_current_buf()
    _G.term_buf_max_nmb = _G.term_buf_max_nmb + 1
    vim.api.nvim_buf_set_name(cur_buf, "Terminal " .. _G.term_buf_max_nmb)
    table.insert(_G.term_buf_of_tab, cur_tab, cur_buf)
    vim.cmd(':startinsert')
end

function Toggle_terminal()
    local cur_tab = vim.api.nvim_get_current_tabpage()
    local term_buf = term_buf_of_tab[cur_tab]
    if term_buf ~= nil then
        local cur_buf = vim.api.nvim_get_current_buf()
        if cur_buf == term_buf then
            vim.cmd('q')
        else
            local win_list = vim.api.nvim_tabpage_list_wins(cur_tab)
            for _, win in ipairs(win_list) do
                local win_buf = vim.api.nvim_win_get_buf(win)
                if win_buf == term_buf then
                    vim.api.nvim_set_current_win(win)
                    vim.cmd(':startinsert')
                    return
                end
            end
            vim.cmd('vert sb' .. term_buf)
            vim.cmd(':startinsert')
        end
    else
        spawn_terminal()
        vim.cmd(':startinsert')
    end
end
vim.keymap.set('n', '<c-y>', Toggle_terminal)
vim.keymap.set('i', '<c-y>', '<ESC>:lua Toggle_terminal()<CR>')
vim.keymap.set('t', '<c-y>', '<c-\\><c-n>:lua Toggle_terminal()<CR>')



cmd([[
if has('nvim')
   au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif]])

Send_line_to_terminal = function()
    local curr_line = vim.api.nvim_get_current_line()
    local cur_tab = vim.api.nvim_get_current_tabpage()
    local term_buf = term_buf_of_tab[cur_tab]
    if term_buf == nil then
        spawn_terminal()
        term_buf = term_buf_of_tab[cur_tab]
    end
    for _, chan in pairs(vim.api.nvim_list_chans()) do
        if chan.buffer == term_buf then chan_id = chan.id end
    end
    vim.api.nvim_chan_send(chan_id, curr_line .. '\n')
end

vim.keymap.set('n', '<leader>x', ':lua Send_line_to_terminal()<CR>')

require"nvim-treesitter.configs".setup {playground = {enable = true}}

vim.keymap.set('n', '<c-o>', '<c-o>zz')
vim.keymap.set('n', '<c-i>', '<c-i>zz')

-- 'L3MON4D3/LuaSnip'
-- local has_words_before = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and
--                vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
--                                                                           col)
--                    :match("%s") == nil
-- end
--
-- local ls = require("luasnip")

-- ls.add_snippets("cds", {
--     ls.snippet("field", ls.text_node("YY1_CrByIncidentMgmt_SDH")),
--     ls.snippet("topic", ls.text_node(
--                    "sap/cap/incidents/ce/sap/s4/beh/salesorder/v1/SalesOrder/Changed/v1"))
-- })
-- ls.add_snippets("json", {
--     ls.snippet("path", ls.text_node('/sap/opu/odata/sap/API_SALES_ORDER_SRV'))
-- })
-- ls.add_snippets("javascript", {
--     ls.snippet("block", ls.text_node("DeliveryBlockReason")),
--     ls.snippet("payload", ls.text_node({
--         " {", "    SalesOrderType: 'OR',", "    SalesOrganization: '1710',",
--         "   DistributionChannel: '10',", "   OrganizationDivision: '00',",
--         "   SoldToParty: '17100002',",
--         "   PurchaseOrderByCustomer: 'Incident: ' + title,",
--         "   YY1_CrByIncidentMgmt_SDH: true,", "   to_Item: orders.map(o => ({",
--         "     Material: o.product,", "     RequestedQuantity: o.quantity,",
--         "     RequestedQuantityUnit: o.unitOfMeasure", "   }))", " }"
--     }))
-- })

-- local cmp = require("cmp")

-- cmp.setup({
--     snippet = {expand = function(args) ls.lsp_expand(args.body) end},
--     mapping = {
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<CR>'] = cmp.mapping.confirm({select = false}),
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-n>'] = cmp.mapping.select_next_item({
--             behavior = cmp.SelectBehavior.Insert
--         }),
--         ['<C-p>'] = cmp.mapping.select_prev_item({
--             behavior = cmp.SelectBehavior.Insert
--         }),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--             if ls.expand_or_jumpable() then
--                 ls.expand_or_jump()
--             else
--                 fallback()
--             end
--         end, {"i", "s"}),

--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if ls.jumpable(-1) then
--                 ls.jump(-1)
--             else
--                 fallback()
--             end
--         end, {"i", "s"})
--     },
--     sources = {
--         {name = 'npm'}, {name = 'luasnip'}, {name = 'nvim_lsp'},
--         {name = 'buffer', keyword_length = 5}
--     }
--     -- formatting = {
--     --   format = lspkind.cmp_format({with_text = false, maxwidth = 50})
--     -- }
-- })

-- local t = function(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
--
-- _G.expand = function()
--     -- print("hurray!!")
--     if ls.expand_or_jumpable() then return t("<Plug>luasnip-expand-or-jump") end
--     return ''
-- end
--
-- _G.expand_back = function()
--     -- print("hurray!!")
--     if ls.jumpable(-1) then return t("<Plug>luasnip-jump-prev") end
--     return ''
-- end
--
-- vim.api.nvim_set_keymap('i', '<c-j>', 'v:lua.expand()', {expr = true})
-- vim.api.nvim_set_keymap('i', '<c-k>', 'v:lua.expand_back()', {expr = true})
-- vim.api.nvim_set_keymap('s', '<c-j>', 'v:lua.expand()', {expr = true})
-- vim.api.nvim_set_keymap('s', '<c-k>', 'v:lua.expand_back()', {expr = true})
--
-- vim.keymap.set('n', '<leader>ls',
--                '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')
--
_G.test_dap = function()
    local dap = require 'dap'
    -- dap.terminate(nil, nil, function()
    --   vim.wait(2000, function()
    --     local session = dap.session()
    --     return session and session.initialized
    --   end)
    -- dap.run({
    --   console = "integratedTerminal",
    --   cwd = "/Users/d065023/tmp/node-test",
    --   disableOptimisticBPs = true,
    --   port = 9229,
    --   protocol = "inspector",
    --   request = "launch",
    --   runtimeArgs = { "--inspect-brk", "plain.js" },
    --   type = "pwa-node"
    --   })
    -- end)
    dap.run({
        type = 'pwa-node',
        request = 'launch',
        cwd = '/Users/d065023/tmp/node-test',
        rootPath = '/Users/d065023/tmp/node-test',
        runtimeArgs = {
            '--inspect-brk', './node_modules/.bin/jest', '--no-coverage', '-t',
            '^foo$', '--', 'sample.test.js'
        },
        args = {'--no-cache'},
        console = 'integratedTerminal'
    })
end

-- ldelossa/gh.nvim
-- require('litee.lib').setup()
-- require('litee.gh').setup({
--   prefer_https_remote = true
-- })

-- nvim-telescope/telescope-ui-select.nvim
require("telescope").load_extension("ui-select")

-- require("github-theme").setup({
--   theme_style = "dark",
-- })

vim.keymap.set('i', '<c-o>', '<esc><s-o>')
vim.keymap.set('n', '<leader>p', ':Lazy<CR>')
-- vim.api.nvim_create_autocmd('BufHidden',  {
--     pattern  = '[dap-terminal]*',
--     callback = function(arg)
--       vim.schedule(function() vim.api.nvim_buf_delete(arg.buf, { force = true }) end)
--     end
-- })

vim.keymap.set('n', '<leader>?',
               'orequire("/usr/local/lib/node_modules/derive-type/")(...arguments)<esc>')

local dap, dapui = require("dap"), require("dapui")
dapui.setup()
vim.keymap.set('n', '<leader>do', function() require("dapui").open() end)
vim.keymap.set('n', '<leader>dC', function() require("dapui").close() end)
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
dap.listeners.before.event_terminated["dapui_config"] =
    function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

require('mason').setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
            settings = {Lua = {diagnostics = {globals = {'vim'}}}}
        })
    end
}

vim.keymap.set('v', '<leader>]', ':Gen<CR>')
vim.keymap.set('n', '<leader>]', ':Gen<CR>')
vim.keymap.set('n', '<leader>[', ':Gen Generate<CR>')
-- require('gen').model = 'mistral'

-- vim.api.nvim_create_autocmd("CursorHold", {callback = vim.lsp.buf.document_highlight})
-- vim.api.nvim_create_autocmd("CursorMoved", {callback = vim.lsp.buf.clear_references})

-- vim.api.nvim_create_autocmd("CursorMoved", {callback = require'spotlight'.run})
--
--

-- require('mini.base16').setup({
--   palette = {
--     base00 = '#dee3ea', -- background
--     base01 = '#dee3ea', -- borders,
--     base01 = '#dee3ea', -- borders,
--     base02 = '#ffffff', -- borders2 and visual
--     base03 = '#4db1ff',
--     base04 = '#0070F2', -- comments
--     base05 = '#5b738b', -- text output
--     base06 = '#0070f2', -- unknown
--     base07 = '#0070f2', -- unknown
--     base08 = '#0070F2', -- fields
--     base09 = '#0070f2', -- unknown
--     base0A = '#4db1ff', -- unknown
--     base0B = '#188918', -- strings
--     base0C = '#4db1ff', -- function calls
--     base0D = '#0070f2', -- function calls 2
--     base0E = '#7858FF', -- keywords
--     base0F = '#d30f15', -- brackets
--   }
-- })
--
-- -- palette = {
-- --   base00 = '#ffffff', -- background
-- --   base01 = '#ffffff', -- borders,
-- --   base01 = '#ffffff', -- borders,
-- --   base02 = '#ffffff', -- borders2 and visual
-- --   base03 = '#4db1ff',
-- --   base04 = '#0070F2', -- comments
-- --   base05 = '#0070F2', -- text output
-- --   base06 = '#d30f15', -- unknown
-- --   base07 = '#d30f15', -- unknown
-- --   base08 = '#0070F2', -- fields
-- --   base09 = '#d30f15', -- unknown
-- --   base0A = '#4db1ff', -- unknown
-- --   base0B = '#188918', -- strings
-- --   base0C = '#4db1ff', -- function calls
-- --   base0D = '#d30f15', -- function calls 2
-- --   base0E = '#7858FF', -- keywords
-- --   base0F = '#d30f15', -- brackets
-- -- }
--
-- vim.o.ls = 0
-- vim.o.ch = 0
--
--
-- 
--
--
--
-- require('gen').model = 'zephyr'
-- require('gen').prompts['Elaborate_Text'] = {
--   prompt = "Elaborate the following text:\n$text",
--   replace = true
-- }
-- require('gen').prompts['Fix_Code'] = {
--   prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
--   replace = true,
--   extract = "```$filetype\n(.-)```"
-- }
