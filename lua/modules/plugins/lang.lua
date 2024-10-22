local lang = {}

lang["kevinhwang91/nvim-bqf"] = {
	lazy = true,
	ft = "qf",
	config = require("lang.bqf"),
	dependencies = {
		{ "junegunn/fzf", build = ":call fzf#install()" },
	},
}
lang["ray-x/go.nvim"] = {
	lazy = true,
	ft = { "go", "gomod", "gosum" },
	build = ":GoInstallBinaries",
	config = require("lang.go"),
	dependencies = { "ray-x/guihua.lua" },
}
lang["mrcjkb/rustaceanvim"] = {
	lazy = true,
	ft = "rust",
	version = "*",
	init = require("lang.rust"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["Saecki/crates.nvim"] = {
	lazy = true,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
-- @func: markdown
-- @keymap: ../../keymap/lang.lua:9
-- @status: [DONE:]
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}

-- @func: markdown in nvim
-- @keymap: ../../keymap/lang.lua:16
-- @status: [DONE:]
lang["MeanderingProgrammer/render-markdown.nvim"] = {
	lazy = true,
	ft = "markdown",
	config = require("lang.render-markdown"),
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},
}

lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
}
-- @func: Leetcode
-- @keymap: ../../keymap/lang.lua:12
-- @status: [DONE:]
lang["kawre/leetcode.nvim"] = {
	lazy = true,
	build = ":TSUpdate html",
	cmd = { "Leet" },
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
		{
			"3rd/image.nvim",
			config = require("lang.image"),
		},
	},
	config = require("lang.leetcode"),
}
return lang
