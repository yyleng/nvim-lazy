local tool = {}

-- @func: Git 管理
-- @keymap: ../../keymap/tool.lua:10
-- @status: [DONE:]
tool["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}

-- @func: 代码层级树 [Unnecessary]
-- @keymap: 鼠标
-- @status: Not Used
-- tool["Bekaboo/dropbar.nvim"] = {
-- 	lazy = false,
-- 	config = require("tool.dropbar"),
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 		"nvim-telescope/telescope-fzf-native.nvim",
-- 	},
-- }

-- @func: 目录树
-- @keymap: ../../keymap/tool.lua:40
-- @status: [DONE:]
tool["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
	},
	config = require("tool.nvim-tree"),
}

-- @func: 复制修正到系统剪贴板
-- @keymap: y
-- @status: [DONE:]
tool["ibhagwan/smartyank.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("tool.smartyank"),
}

-- @func: 运行代码片段
-- @keymap: ../../keymap/tool.lua:45
-- @status: [DONE:]
tool["michaelb/sniprun"] = {
	lazy = true,
	-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
	-- if you encountered error about no executable sniprun found.
	build = "bash ./install.sh",
	cmd = { "SnipRun", "SnipReset", "SnipInfo" },
	config = require("tool.sniprun"),
}

-- @func: 虚拟终端
-- @keymap: ../../keymap/tool.lua:49
-- @status: [DONE:]
tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}

-- @func: 展示代码错误,引用
-- @keymap: ../../keymap/tool.lua:85
-- @status: [DONE:]
tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}

-- @func: 快捷键提示
-- @keymap: nil
-- @status: [TODO: 补充提示配置]
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("tool.which-key"),
}

-- @func: 命令行模糊搜索以及自动补充
-- @keymap: / | : | ?
-- @status: [DONE:]
tool["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("tool.wilder"),
	dependencies = { "romgrk/fzy-lua-native" },
}

-- @func: 列出所有 buffer
-- @keymap: ../../keymap/tool.lua:100
-- @status: [DONE:]
tool["j-morano/buffer_manager.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		require("buffer_manager").setup()
	end,
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
-- @func: 大工具箱
-- @keymap: ../../keymap/tool.lua:106
-- @status: [DONE:]
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "jvgrootveld/telescope-zoxide" },
		{ "debugloop/telescope-undo.nvim" },
		{ "nvim-telescope/telescope-frecency.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"FabianWirth/search.nvim",
			config = require("tool.search"),
		},
		{
			"ahmedkhalf/project.nvim",
			event = { "CursorHold", "CursorHoldI" },
			config = require("tool.project"),
		},
		{
			"aaronhallaert/advanced-git-search.nvim",
			cmd = { "AdvancedGitSearch" },
			dependencies = {
				"tpope/vim-rhubarb",
				"tpope/vim-fugitive",
				"sindrets/diffview.nvim",
			},
		},
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
-- @func: 调试器
-- @keymap: ../../keymap/tool.lua:156
-- @status: [DONE:]
tool["mfussenegger/nvim-dap"] = {
	lazy = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	config = require("tool.dap"),
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = require("tool.dap.dapui"),
			dependencies = {
				"nvim-neotest/nvim-nio",
			},
		},
		{ "jay-babu/mason-nvim-dap.nvim" },
	},
}

return tool
