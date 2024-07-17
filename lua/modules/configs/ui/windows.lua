return function()
	vim.o.winwidth = 10
	vim.o.winminwidth = 10
	vim.o.equalalways = false
	require("modules.utils").load_plugin("windows", {
		autowidth = {
			--		       |windows.autowidth|
			enable = true,
			winwidth = 50, --		        |width = equal+50|
			filetype = { --	      |windows.autowidth.filetype|
				help = 2,
			},
		},
		-- 忽视文件
		ignore = {
			--			  |windows.ignore|
			buftype = { "quickfix" },
			filetype = { "coc-explorer", "NvimTree", "neo-tree", "undotree", "gundo" },
		},
		-- 展示动画
		animation = {
			enable = false,
			duration = 300,
			fps = 30,
			easing = "in_out_sine",
		},
	})
end
