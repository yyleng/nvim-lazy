local ui = {}

-- @func: vim 面板
-- @keymap: nil
-- @status: [DONE:]
ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("ui.alpha"),
}

-- @func: vim主题
-- @keymap: :Telescope colorscheme
-- @status: [DONE:]
ui["Jint-lzxy/nvim"] = {
	lazy = false,
	branch = "refactor/syntax-highlighting",
	name = "catppuccin",
	config = require("ui.catppuccin"),
}

-- @func: vim默认主题
-- @keymap: :Telescope colorscheme
-- @status: [DONE:]
ui["morhetz/gruvbox"] = {
	lazy = false,
	name = "gruvbox",
	config = require("ui.gruvbox"),
}

-- @func: 右下角消息通知
-- @keymap: nil
-- @status: [DONE:]
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.fidget"),
}

-- @func: git 快速操作
-- @keymap: ../../keymap/ui.lua:34
-- @status: [DONE:]
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}

-- @func: 显示缩进对齐线
-- @keymap: nil
-- @status: [DONE:]
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.indent-blankline"),
}

-- @func: 下方状态栏
-- @keymap: nil
-- @status: [DONE:]
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}

-- @func: 调暗未使用的函数、变量、参数等
-- @keymap: nil
-- @status: [DONE:]
ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}

-- @func: 屏幕滚动
-- @keymap: "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb",
-- @status: [DONE:]
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.neoscroll"),
}

-- @func: 通知栏
-- @keymap: nil
-- @status: [DONE:]
ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.notify"),
}

-- @func: 新增高亮
-- @keymap: nil
-- @status: [DONE:]
ui["folke/paint.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}

-- @func: todo 注释高亮、汇总
-- @keymap: ../../keymap/ui.lua:21
-- @status: [DONE:]
ui["folke/todo-comments.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.todo"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

-- @func: 自动调整窗口大小
-- @keymap: ../../keymap/ui.lua:9
-- @status: [DONE:]
ui["anuvyklack/windows.nvim"] = {
	lazy = false,
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	config = require("ui.windows"),
}

return ui
