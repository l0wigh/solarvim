--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
vim.cmd("set tabstop=4") -- tab width
vim.cmd("set shiftwidth=4") -- tab width
vim.cmd("set softtabstop=4") -- tab width
vim.cmd("set noexpandtab") -- tab != space
vim.cmd("set relativenumber") -- show relative number
vim.cmd("set nohlsearch") -- remove horrible persistent highlight after a search
vim.cmd("set incsearch") -- highlight while searching
vim.cmd("set scrolloff=8") -- scrolling position
vim.cmd("set noswapfile") -- remove horrible swap files
vim.cmd("set nobackup") -- no need for backup, we are responsible
vim.cmd("set undofile") -- undo files for undo tree
vim.cmd("set undodir=~/.config/lvim/undodir") -- create that folder you mad lads

lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "NeoSolarized"
lvim.builtin.lualine.style = "default"
vim.cmd("autocmd VimEnter * hi Normal guibg=none")
vim.cmd("autocmd VimEnter * hi LineNr guibg=none")
vim.cmd("autocmd VimEnter * hi SignColumn guibg=none")
vim.cmd("autocmd VimEnter * hi NormalNC guibg=none")
vim.cmd("autocmd VimEnter * hi MsgArea guibg=none")
vim.cmd("autocmd VimEnter * hi TelescopeBorder guibg=none")
vim.cmd("autocmd VimEnter * hi NvimTreeNormal guibg=none")

vim.g.bracey_refresh_on_save = 1

-- keymappings [view all the defaults by pressing <leader>Lk]
vim.cmd [[
  nnoremap j h
  nnoremap k j
  nnoremap l k
  nnoremap m l
  nnoremap h m
  nnoremap ù 0

  vnoremap j h
  vnoremap k j
  vnoremap l k
  vnoremap m l
  vnoremap h m
  vnoremap ù 0

  nnoremap <C-w>j <C-w>h
  nnoremap <C-w>k <C-w>j
  nnoremap <C-w>l <C-w>k
  nnoremap <C-w>m <C-w>l
  nnoremap <C-w>h <C-w>m
]]

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.line_wrap_cursor_movement = false
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- Additional Plugins
lvim.plugins = {
	{"L0Wigh/NeoSolarized"},
	{"Pocco81/AutoSave.nvim"},
	{"RRethy/vim-hexokinase", run = "make hexokinase"},
	{"mbbill/undotree"},
	{"kevinhwang91/rnvimr"},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function ()
			require("lsp_signature").setup()
		end
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline"
	},
	{
		"turbio/bracey.vim",
		cmd = {"Bracey", "BraceyStop", "BraceyReload", "BraceyEval"},
		run = "npm install --prefix server"
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

lvim.builtin.which_key.mappings = {
	["r"] = { "<cmd>RnvimrToggle<CR>", "Ranger" },
	["/"] = { "<cmd>lua require('Comment').toggle()<CR>", "Comment" },
	["u"] = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", "Undotree" },
	w = {
		name = "+Windows",
		h = {"<cmd>split<CR>", "Horizontal Split"},
		v = {"<cmd>vsplit<CR>", "Veritcal Split"},
		c = {"<cmd>:q<CR>", "Close Current Split"},
		x = {"<C-w>x", "Swap Windows"},
		t = {"<cmd>call ToggleWindows()<CR>", "Switch Split Type"},

		-- j = {"<C-w>j", "Move to left window"},
		-- k = {"<C-w>k", "Move to bottom window"},
		-- l = {"<C-w>l", "Move to top window"},
		-- m = {"<C-w>m", "Move to right window"}
	},
	t = {
		name = "+Tabs",
		n = {"<cmd>tabnew<CR>", "New Tab"},
		c = {"<cmd>tabclose<CR>", "Close Current Tab"},
		m = {"<cmd>tabnext<CR>", "Next Tab"},
		j = {"<cmd>tabprevious<CR>", "Previous Tab"},
	},
	b = {
		name = "+Buffer",
		p = {"<cmd>BufferPin<CR>", "Pin Buffer"},
		e = {"<cmd>BufferCloseAllButCurrent<CR>", "Close All But Current"},
		a = {"<cmd>BufferCloseAllButPinned<CR>", "Close All But Pinned"},
		c = {"<cmd>BufferClose!<CR>", "Close Buffer"},
	},
	p = {
		name = "+Plugins",
		-- Telescope
		t = {
			name = "+Telescope" ,
			f = {"<cmd>Telescope find_files<cr>", "Find files" },
			h = {"<cmd>Telescope help_tags<cr>", "Help pages" },
			c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
			b = {"<cmd>Telescope buffers show_all_buffers=true<cr>", "Show Buffers"},
		},
		-- Packer
		p = {
			name = "+Packer",
			i = { "<cmd>PackerInstall<cr>", "Install" },
			r = { "<cmd>lua require('lv-utils').reload_lv_config()<cr>", "Reload" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},
		-- Bracey
		b = {
			name = "+Bracey",
			s = { "<cmd>Bracey<cr>", "Start Server" },
			k = { "<cmd>BraceyStop<cr>", "Kill Server" },
			r = { "<cmd>BraceyReload<cr>", "Reload Server" },
			e = { "<cmd>BraceyEval<cr>", "Eval Current Buffer" },
		},
		-- Symbols Outline
		s = {"<cmd>SymbolsOutline<CR>", "Show/Hide Symbols"},
	}
}



local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local newMap = {
	{ key = {"<CR>"}, cb = tree_cb("edit") },
	{ key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
	{ key = "<C-v>",                        cb = tree_cb("vsplit") },
	{ key = "<C-x>",                        cb = tree_cb("split") },
	{ key = "<C-t>",                        cb = tree_cb("tabnew") },
	{ key = "<",                            cb = tree_cb("prev_sibling") },
	{ key = ">",                            cb = tree_cb("next_sibling") },
	{ key = "P",                            cb = tree_cb("parent_node") },
	{ key = "<BS>",                         cb = tree_cb("close_node") },
	{ key = "<S-CR>",                       cb = tree_cb("close_node") },
	{ key = "<Tab>",                        cb = tree_cb("preview") },
	{ key = "K",                            cb = tree_cb("first_sibling") },
	{ key = "J",                            cb = tree_cb("last_sibling") },
	{ key = "I",                            cb = tree_cb("toggle_ignored") },
	{ key = "H",                            cb = tree_cb("toggle_dotfiles") },
	{ key = "R",                            cb = tree_cb("refresh") },
	{ key = "n",                            cb = tree_cb("create") },
	{ key = "d",                            cb = tree_cb("remove") },
	{ key = "r",                            cb = tree_cb("rename") },
	{ key = "<C-r>",                        cb = tree_cb("full_rename") },
	{ key = "x",                            cb = tree_cb("cut") },
	{ key = "c",                            cb = tree_cb("copy") },
	{ key = "p",                            cb = tree_cb("paste") },
	{ key = "y",                            cb = tree_cb("copy_name") },
	{ key = "Y",                            cb = tree_cb("copy_path") },
	{ key = "gy",                           cb = tree_cb("copy_absolute_path") },
	{ key = "[c",                           cb = tree_cb("prev_git_item") },
	{ key = "]c",                           cb = tree_cb("next_git_item") },
	{ key = "-",                            cb = tree_cb("dir_up") },
	{ key = "s",                            cb = tree_cb("system_open") },
	{ key = "q",                            cb = tree_cb("close") },
	{ key = "g?",                           cb = tree_cb("toggle_help") },
}


lvim.builtin.nvimtree.setup.view.mappings = {
	custom_only = true,
	list = newMap
}

vim.cmd [[
	function! ToggleWindows()
	  if !exists('t:splitType')
	    let t:splitType = 'vertical'
	  endif
	  if t:splitType == 'vertical' " is vertical switch to horizontal
    windo wincmd K
    let t:splitType = 'horizontal'
  else " is horizontal switch to vertical
	    windo wincmd H
	    let t:splitType = 'vertical'
	  endif
endfunction
]]

require("nvim-lsp-installer").settings {
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
}

local autosave = require("autosave")
autosave.setup(
  {
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = {"InsertLeave", "TextChanged"},
    conditions = {
      exists = true,
      filename_is_not = {"config", "config.lua"},
      filetype_is_not = {"lua"},
      modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
  }
)

vim.cmd([[
  let g:Hexokinase_highlighters = ['foregroundfull']
]])
