local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local plug_map = {
	-- Plugin MarkdownPreview
	["n|<F12>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent():with_desc("tool: Preview markdown"),

	-- Plugin Leetcode
	["n|<leader>lc"] = map_cr("Leet"):with_noremap():with_silent():with_desc("leetcode: open it"),
	---- subkey
	---- ../modules/configs/lang/leetcode.lua:8
	-- Plugin render-markdown.nvim
	["n|<F1>"] = map_cr("RenderMarkdown toggle")
		:with_noremap()
		:with_silent()
		:with_desc("tool: toggle markdown preview within nvim"),
}

bind.nvim_load_mapping(plug_map)
