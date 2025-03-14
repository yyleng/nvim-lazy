local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
	["n|<A-S-f>"] = map_cmd("<Cmd>FormatToggle<CR>"):with_noremap():with_desc("formatter: Toggle format on save"),
}
bind.nvim_load_mapping(plug_map)

local mapping = {}

function mapping.lsp(buf)
	local map = {
		-- LSP-related keymaps, ONLY effective in buffers with LSP(s) attached
		["n|<leader>li"] = map_cr("LspInfo"):with_silent():with_buffer(buf):with_desc("lsp: Info"),
		["n|<leader>lr"] = map_cr("LspRestart"):with_silent():with_buffer(buf):with_nowait():with_desc("lsp: Restart"),
		-- ["n|go"] = map_cr("AerialToggle!"):with_silent():with_buffer(buf):with_desc("lsp: Toggle outline"),
		["n|go"] = map_cr("Lspsaga outline"):with_silent():with_buffer(buf):with_desc("lsp: Toggle outline"),
		-- ["n|go"] = map_cr("Trouble symbols"):with_silent():with_buffer(buf):with_desc("lsp: Toggle outline"),
		["n|gto"] = map_callback(function()
				require("telescope").extensions.aerial.aerial()
			end)
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Toggle outline in Telescope"),
		["n|gs"] = map_callback(function()
			vim.lsp.buf.signature_help()
		end):with_desc("lsp: Signature help"),
		["n|<leader>rn"] = map_cr("Lspsaga rename")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Rename in file range"),
		["n|<leader>rN"] = map_cr("Lspsaga rename ++project")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Rename in project range"),
		["n|K"] = map_cr("Lspsaga hover_doc"):with_silent():with_buffer(buf):with_desc("lsp: Show doc"),
		["n|<leader>k"] = map_cr("Lspsaga show_line_diagnostics")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Show line show_line_diagnostics"),
		["nv|ga"] = map_cr("Lspsaga code_action")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Code action for cursor"),
		-- ["n|gd"] = map_cr("Glance definitions"):with_silent():with_buffer(buf):with_desc("lsp: Preview definition"),
		["n|gd"] = map_cr("Lspsaga goto_definition"):with_silent():with_buffer(buf):with_desc("lsp: Goto definition"),
		-- ["n|gr"] = map_cr("Glance references"):with_silent():with_buffer(buf):with_desc("lsp: Show reference"),
		["n|gr"] = map_cr("Trouble lsp_references"):with_silent():with_buffer(buf):with_desc("lsp: Show reference"),
		["n|gm"] = map_cr("Glance implementations")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Show implementation"),
		["n|gci"] = map_cr("Lspsaga incoming_calls")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Show incoming calls"),
		["n|gco"] = map_cr("Lspsaga outgoing_calls")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Show outgoing calls"),
	}
	bind.nvim_load_mapping(map)

	local ok, user_mappings = pcall(require, "user.keymap.completion")
	if ok and type(user_mappings.lsp) == "function" then
		require("modules.utils.keymap").replace(user_mappings.lsp(buf))
	end
end

return mapping
