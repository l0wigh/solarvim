-- SolarVim Config
-- Version 1.5

--[[
	TODO for SolarVim 1.6 :
		- ?
]]--

require("solarboard")

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

-- Transparency for the background (better than the original lvim option)
vim.cmd("autocmd VimEnter * hi Normal guibg=none")
vim.cmd("autocmd VimEnter * hi LineNr guibg=none")
vim.cmd("autocmd VimEnter * hi SignColumn guibg=none")
vim.cmd("autocmd VimEnter * hi NormalNC guibg=none")
vim.cmd("autocmd VimEnter * hi MsgArea guibg=none")
vim.cmd("autocmd VimEnter * hi TelescopeBorder guibg=none")
vim.cmd("autocmd VimEnter * hi NvimTreeNormal guibg=none")

-- Force Bracey to refresh the page on reload
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
lvim.line_wrap_cursor_movement = false -- I hate when that option is on true, please never make it true again

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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

-- Additional Plugins
lvim.plugins = {
	{"L0Wigh/NeoSolarized"},
	{'folke/lsp-colors.nvim'},
	{'jiangmiao/auto-pairs'},
	{"glepnir/lspsaga.nvim"},
	{"weilbith/nvim-code-action-menu", cmd = "CodeActionMenu"},
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

-- Custom which-key config for better mnemonic and better menu arrangement
lvim.builtin.which_key.mappings = {
	["r"] = { "<cmd>RnvimrToggle<CR>", "Ranger" },
	["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
	["u"] = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", "Undotree" },
	w = {
		name = "+Windows",
		h = {"<cmd>split<CR>", "Horizontal Split"},
		v = {"<cmd>vsplit<CR>", "Veritcal Split"},
		c = {"<cmd>:q<CR>", "Close Current Split"},
		x = {"<C-w>x", "Swap Windows"},
		t = {"<cmd>call ToggleWindows()<CR>", "Switch Split Type"},
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
		-- Saga
		s = {
			name = "+Saga",
			r = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename" },
			d = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Preview Definition" },
			p = { "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", "Previous Diagnostics" },
			e = { "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", "Show Diagnostics of the line" },
			n = { "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", "Next Diagnostics" },
		},
		-- Symbols Outline
		o = {"<cmd>SymbolsOutline<CR>", "Show/Hide Symbols"},
		c = {"<cmd>CodeActionMenu<CR>", "Show Code Action"},
	}
}

-- New nvim-tree keymap for fixing a bug
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

-- Asking nvim-tree to use it
lvim.builtin.nvimtree.setup.view.mappings = {
	custom_only = true,
	list = newMap
}

-- Windows orientation swapping
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

-- Less ugly icons for LSP Installer
require("nvim-lsp-installer").settings {
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
}

-- Hexokinase settings for beautiful colors indicator
vim.cmd([[
  let g:Hexokinase_highlighters = ['foregroundfull']
]])

