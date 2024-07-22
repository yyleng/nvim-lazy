local editor = {}

-- @func: 自动补全括号
-- @keymap: nil
-- @status: [DONE:]
editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}

-- @func: 加速大文件加载
-- @keymap: nil
-- @status: [DONE:]
editor["LunarVim/bigfile.nvim"] = {
	lazy = false,
	config = require("editor.bigfile"),
	cond = require("core.settings").load_big_files_faster,
}

-- NOTE: `flash.nvim` is a powerful plugin that can be used as partial or complete replacements for:
--  > `hop.nvim`,
--  > `wilder.nvim`
--  > `nvim-treehopper`
-- Considering its steep learning curve as well as backward compatibility issues...
--  > We have no plan to remove the above plugins for the time being.
-- But as usual, you can always tweak the plugin to your liking.
-- @func: above
-- @keymap: nil
-- @status: [TODO: 待取代之]
editor["folke/flash.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.flash"),
}

-- @func: 代码注释
-- @keymap: ../../keymap/editor.lua:10
-- @status: [DONE:]
editor["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.comment"),
}

-- @func: git diff 查看
-- @keymap: ../../keymap/editor.lua:44
-- @status: [DONE:]
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
	config = require("editor.diffview"),
}

-- @func: 多行文本对齐
-- @keymap: gea | geA
-- @status: [DONE:]
editor["echasnovski/mini.align"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.align"),
}

-- @func: 文本快速跳转
-- @keymap: ../../keymap/editor.lua:57
-- @status: [DONE:]
editor["smoka7/hop.nvim"] = {
	lazy = true,
	version = "*",
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.hop"),
}

-- @func: 高亮鼠标所在位置的相同单词
-- @keymap: nil
-- @status: [DONE:]
editor["tzachar/local-highlight.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.local-highlight"),
}

-- @func: 颜色高亮
-- @keymap: nil
-- @status: [DONE:]
editor["brenoprata10/nvim-highlight-colors"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.highlight-colors"),
}

-- @func: 使用删除键取消搜索高亮时，可以再次搜索，且自动不高亮
-- @keymap: n N
-- @status: [DONE:]
editor["romainl/vim-cool"] = {
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}

-- @func: 以 sudo 的方式操作文件
-- @keymap: ../../keymap/editor.lua:61
-- @status: [DONE:]
editor["lambdalisue/suda.vim"] = {
	lazy = true,
	cmd = { "SudaRead", "SudaWrite" },
	init = require("editor.suda"),
}

-- @func: 自动设置 tab 与空格
-- @keymap: nil
-- @status: [DONE:]
editor["tpope/vim-sleuth"] = {
	lazy = true,
	event = { "BufNewFile", "BufReadPost", "BufFilePost" },
}

-- @func: 文本替换
-- @keymap: ../../keymap/editor.lua:78
-- @status: [DONE:]
editor["nvim-pack/nvim-spectre"] = {
	lazy = true,
	cmd = "Spectre",
}

-- @func: vim 窗口控制
-- @keymap: ../../keymap/editor.lua:64
-- @status: [DONE:]
editor["mrjones2014/smart-splits.nvim"] = {
	lazy = true,
	event = { "CursorHoldI", "CursorHold" },
	config = require("editor.splits"),
}

-- @func: 修改变量形式
-- @keymap: :'n | crc', 'n | crm', 'n | crs' 最常用，更多用法请查阅帮助手册
-- @status: [DONE:]
editor["tpope/vim-abolish"] = {
	lazy = true,
	event = { "CursorHoldI", "CursorHold" },
	config = require("editor.abolish"),
}

-- @func: 单词切割
-- @keymap: 'v | e', 'v | b', 'v | w' 最常用，更多用法请查阅帮助手册
-- @status: true ---------- all done
-- editor["chaoren/vim-wordmotion"] = {
-- 	lazy = true,
-- 	event = { "CursorHold", "CursorHoldI" },
-- 	config = function()
-- 		vim.api.nvim_exec(
-- 			[[
-- 		let g:wordmotion_mappings = {
-- \ 'w': '<M-w>',
-- \ 'b': '<M-b>',
-- \ 'e': '<M-e>',
-- \ 'ge': 'g<M-e>',
-- \ 'aw': 'a<M-w>',
-- \ 'iw': 'i<M-w>',
-- \ '<C-R><C-W>': '<C-R><M-w>'
-- \ }
-- ]],
-- 			false
-- 		)
-- 	end,
-- }

-- @func: v V 框选
-- @keymap: v -> 正选, V -> 反选(撤销)
-- @status: [DONE:]
editor["terryma/vim-expand-region"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = function()
		vim.api.nvim_exec(
			[[
		" 选中区域配置, 1表示递归
let g:expand_region_text_objects = {
  \ 'iw'  :0,
  \ 'i"'  :0, 'a"'  :0,
  \ 'i''' :0, 'a''' :0,
  \ 'i`'  :0, 'a`'  :0,
  \ 'i)'  :1, 'a)'  :1,
  \ 'i]'  :1, 'a]'  :1,
  \ 'i}'  :1, 'a}'  :1,
  \ 'it'  :1, 'at'  :1,
\ }

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

		]],
			false
		)
	end,
}

-- @func: 代码行拆分或合并
-- @keymap: gS -> 拆分, gJ -> 合并
-- @status: [DONE:]
editor["AndrewRadev/splitjoin.vim"] = {
	lazy = false,
}

-- @func: 翻译辞典
-- @keymap: ../../keymap/editor.lua:107
-- @status: [DONE:]
-- online_translate:
-- youdao https://ai.youdao.com/ has app_id and app_passwd
-- baidu https://fanyi-api.baidu.com/ has app_id and app_passwd
editor["JuanZoran/Trans.nvim"] = {
	build = function()
		require("Trans").install()
	end,
	dependencies = { "kkharji/sqlite.lua" },
	config = require("editor.Trans"),
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
-- @func: 代码高亮
-- @keymap: nil
-- @status: [DONE:]
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if vim.fn.has("gui_running") == 1 then
			vim.api.nvim_command([[TSUpdate]])
		end
	end,
	event = "BufReadPre",
	config = require("editor.treesitter"),
	dependencies = {
		{ "andymass/vim-matchup" },
		{ "mfussenegger/nvim-treehopper" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{
			"windwp/nvim-ts-autotag",
			config = require("editor.autotag"),
		},
		{
			"hiphish/rainbow-delimiters.nvim",
			config = require("editor.rainbow_delims"),
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("editor.ts-context"),
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = require("editor.ts-context-commentstring"),
		},
	},
}

return editor
