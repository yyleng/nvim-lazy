-- all ok
local ui = {}

-- @func: vim 面板 [OK]
-- @keymap: nil
-- @status: true ---------- all done
ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("ui.alpha"),
}

-- @func: vim主题 [OK]
-- @keymap: nil
-- @status: true ---------- all done
ui["Jint-lzxy/nvim"] = {
	lazy = false,
	branch = "refactor/syntax-highlighting",
	name = "catppuccin",
	config = require("ui.catppuccin"),
}

-- @func: vim默认主题 [OK]
-- @keymap: nil
-- @status: true ---------- all done
ui["morhetz/gruvbox"] = {
	lazy = false,
	name = "gruvbox",
	config = require("ui.gruvbox"),
}

-- [OK]
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.fidget"),
}

-- @func: git 快速操作 [OK]
-- @keymap: [keymap]
-- @status: true ---------- all done
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}

-- @func: 显示缩进对齐线 [OK]
-- @keymap: nil
-- @status: true ---------- all done
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.indent-blankline"),
}

-- @func: 下方状态栏 [OK]
-- @keymap: nil
-- @status: true ---------- all done
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}

-- @func: 调暗未使用的函数、变量、参数等 [OK]
-- @keymap: nil
-- @status: true ---------- all done
ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}

-- @func: 屏幕滚动 [OK]
-- @keymap: "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb",
-- @status: true ---------- all done
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.neoscroll"),
}

-- @func: 通知栏 [OK]
-- @keymap: nil
-- @status: true ---------- all done
ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.notify"),
}

-- @func: 新增高亮 [OK]
-- @keymap: nil
-- @status: true ---------- all done
ui["folke/paint.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}

-- @func: todo 注释高亮、汇总 [OK]
-- @keymap: [keymap]
-- @status: true ---------- all done
ui["folke/todo-comments.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.todo"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

-- @func: 自动调整窗口大小 [OK]
-- @keymap: [keymap]
-- @status: true --------- all done
ui["anuvyklack/windows.nvim"] = {
	lazy = false,
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	config = require("ui.windows"),
}

return ui
