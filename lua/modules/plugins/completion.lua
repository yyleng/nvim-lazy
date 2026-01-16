-- Define the completion module and core settings
local completion = {}
local settings = require("core.settings")
local use_copilot = settings.use_copilot

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	commit = "3ea9922",
	event = { "CursorHold", "CursorHoldI" },
	config = require("completion.lsp"),
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "folke/neoconf.nvim" },
		{
			"Jint-lzxy/lsp_signature.nvim",
			config = require("completion.lsp-signature"),
		},
	},
}

completion["nvimdev/lspsaga.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("completion.lspsaga"),
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

completion["stevearc/aerial.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("completion.aerial"),
}

completion["DNLHC/glance.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("completion.glance"),
}
completion["joechrisellis/lsp-format-modifications.nvim"] = {
	lazy = true,
	event = "LspAttach",
}
completion["nvimtools/none-ls.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("completion.null-ls"),
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
}
completion["hrsh7th/nvim-cmp"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("completion.cmp"),
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			config = require("completion.luasnip"),
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "ray-x/cmp-treesitter", commit = "c8e3a74" },
		-- { "tzachar/cmp-tabnine", build = "./install.sh", config = require("completion.tabnine") },
		-- {
		-- 	"jcdickinson/codeium.nvim",
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"MunifTanjim/nui.nvim",
		-- 	},
		-- 	config = require("completion.codeium"),
		-- },
	},
}
if use_copilot then
	completion["zbirenbaum/copilot.lua"] = {
		lazy = true,
		cmd = "Copilot",
		event = "InsertEnter",
		config = require("completion.copilot"),
		-- dependencies = {
		-- 	{
		-- 		"zbirenbaum/copilot-cmp",
		-- 		config = require("completion.copilot-cmp"),
		-- 	},
		-- },
	}
end

-- completion["yetone/avante.nvim"] = {
-- 	lazy = true,
-- 	build = "make",
-- 	event = "VeryLazy",
-- 	version = false,
-- 	opts = {
-- 		-- 在此处添加任何选项
-- 		provider = "copilot",
-- 	},
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"MunifTanjim/nui.nvim",
-- 		--- 以下依赖项是可选的，
-- 		"echasnovski/mini.pick", -- 用于文件选择器提供者 mini.pick
-- 		"nvim-telescope/telescope.nvim", -- 用于文件选择器提供者 telescope
-- 		"hrsh7th/nvim-cmp", -- avante 命令和提及的自动完成
-- 		"ibhagwan/fzf-lua", -- 用于文件选择器提供者 fzf
-- 		"nvim-tree/nvim-web-devicons", -- 或 echasnovski/mini.icons
-- 		"zbirenbaum/copilot.lua", -- 用于 providers='copilot'
-- 		{
-- 			-- 支持图像粘贴
-- 			"HakonHarnes/img-clip.nvim",
-- 			event = "VeryLazy",
-- 			opts = {
-- 				-- 推荐设置
-- 				default = {
-- 					embed_image_as_base64 = false,
-- 					prompt_for_file_name = false,
-- 					drag_and_drop = {
-- 						insert_mode = true,
-- 					},
-- 					-- Windows 用户必需
-- 					use_absolute_path = true,
-- 				},
-- 			},
-- 		},
-- 		{
-- 			-- 如果您有 lazy=true，请确保正确设置
-- 			"MeanderingProgrammer/render-markdown.nvim",
-- 			opts = {
-- 				file_types = { "markdown", "Avante" },
-- 			},
-- 			ft = { "markdown", "Avante" },
-- 		},
-- 	},
-- }

completion["milanglacier/minuet-ai.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = function()
		require("minuet").setup({
			virtualtext = {
				auto_trigger_ft = {},
				keymap = {
					-- accept whole completion
					accept = "<A-r>",
					-- accept one line
					accept_line = "<A-a>",
					-- accept n lines (prompts for number)
					-- e.g. "A-z 2 CR" will accept 2 lines
					accept_n_lines = "<A-z>",
					-- Cycle to prev completion item, or manually invoke completion
					prev = "<A-[>",
					-- Cycle to next completion item, or manually invoke completion
					next = "<A-]>",
					dismiss = "<A-e>",
				},
			},
			provider = "openai_compatible",
			request_timeout = 25000, -- sec
			n_completions = 1, -- recommend for local model for resource saving
			provider_options = {
				openai_compatible = {
					end_point = "http://10.24.73.32:8001/v1/chat/completions",
					api_key = function()
						return "token-abc123"
					end,
					name = "Qwen3-Coder-30B-A3B-Instruct-FP8",
					model = "Qwen3-Coder-30B-A3B-Instruct-FP8",
					optional = {
						max_tokens = 512,
						top_p = 0.8,
						temperature = 0.7,
						top_k = 20,
					},
				},
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

return completion
