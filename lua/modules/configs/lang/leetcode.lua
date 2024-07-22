return function()
	require("modules.utils").load_plugin("leetcode", {
		cn = {
			enabled = true,
		},
		image_support = true,
		keys = {
			toggle = { "q" }, ---@type string|string[]
			confirm = { "<CR>" }, ---@type string|string[]

			reset_testcases = "r", ---@type string
			use_testcase = "U", ---@type string
			focus_testcases = "<C-h>", ---@type string
			focus_result = "<C-l>", ---@type string
		},
	})
end
