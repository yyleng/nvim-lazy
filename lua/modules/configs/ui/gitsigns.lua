return function()
	local mapping = require("keymap.ui")
	require("modules.utils").load_plugin("gitsigns", {
		signs = {
			add = { text = "A" },
			change = { text = "M" },
			delete = { text = "D" },
			topdelete = { text = "D" },
			changedelete = { text = "D" },
			untracked = { text = "U" },
		},
		auto_attach = true,
		on_attach = mapping.gitsigns,
		signcolumn = true,
		sign_priority = 6,
		update_debounce = 100,
		word_diff = false,
		current_line_blame = true,
		diff_opts = { internal = true },
		watch_gitdir = { follow_files = true },
		current_line_blame_opts = { delay = 1000, virt_text = true, virtual_text_pos = "eol" },
	})
end
