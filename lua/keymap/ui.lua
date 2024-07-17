local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local plug_map = {
	-- Plugin: windows.nvim
	["n|<C-w>z"] = map_cr("WindowsMaximize"):with_noremap():with_silent():with_desc("windows: Maximize window"),
	["n|<C-w>_"] = map_cr("WindowsMaximizeVertically")
		:with_noremap()
		:with_silent()
		:with_desc("windows: Maximize vertically"),
	["n|<C-w>|"] = map_cr("WindowsMaximizeHorizontally")
		:with_noremap()
		:with_silent()
		:with_desc("windows: Maximize horizontally"),
	["n|<C-w>="] = map_cr("WindowsEqualize"):with_noremap():with_silent():with_desc("windows: Equalize window"),

	-- Plugin: todo-comments.nvim
	["n|<leader>td"] = map_cr("TodoQuickFix")
		:with_noremap()
		:with_silent()
		:with_desc("todo-comments: Open todo list of project"),
}

bind.nvim_load_mapping(plug_map)

local mapping = {}

function mapping.gitsigns(buf)
	local actions = require("gitsigns.actions")
	local map = {
		["n|]g"] = bind.map_callback(function()
			if vim.wo.diff then
				return "]g"
			end
			vim.schedule(function()
				actions.next_hunk()
			end)
			return "<Ignore>"
		end)
			:with_buffer(buf)
			:with_expr()
			:with_desc("git: Goto next hunk"),
		["n|[g"] = bind.map_callback(function()
			if vim.wo.diff then
				return "[g"
			end
			vim.schedule(function()
				actions.prev_hunk()
			end)
			return "<Ignore>"
		end)
			:with_buffer(buf)
			:with_expr()
			:with_desc("git: Goto prev hunk"),
		["n|]s"] = bind.map_callback(function()
			actions.stage_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Stage hunk"),

		["v|]s"] = bind.map_callback(function()
			actions.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
			:with_buffer(buf)
			:with_desc("git: Stage hunk"),
		["n|]u"] = bind.map_callback(function()
			actions.undo_stage_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Undo stage hunk"),
		["n|]r"] = bind.map_callback(function()
			actions.reset_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Reset hunk"),
		["v|]r"] = bind.map_callback(function()
			actions.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
			:with_buffer(buf)
			:with_desc("git: Reset hunk"),
		["n|]R"] = bind.map_callback(function()
			actions.reset_buffer()
		end)
			:with_buffer(buf)
			:with_desc("git: Reset buffer"),
		["n|]ph"] = bind.map_callback(function()
			actions.preview_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Preview hunk"),
		["n|]b"] = bind.map_callback(function()
			actions.blame_line({ full = true })
		end)
			:with_buffer(buf)
			:with_desc("git: Blame line"),
		-- Text objects
		["ox|ih"] = bind.map_callback(function()
			actions.select_hunk()
		end):with_buffer(buf),
	}
	bind.nvim_load_mapping(map)
end

return mapping
