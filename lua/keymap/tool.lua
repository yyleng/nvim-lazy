local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
require("keymap.helpers")

local plug_map = {
	-- Plugin: vim-fugitive
	["n|gps"] = map_cr("G push"):with_noremap():with_silent():with_desc("git: Push"),
	["n|gpl"] = map_cr("G pull"):with_noremap():with_silent():with_desc("git: Pull"),
	["n|glg"] = map_cr("G log --stat"):with_noremap():with_silent():with_desc("git: stat log"),
	["n|glgg"] = map_cr("G log --graph"):with_noremap():with_silent():with_desc("git: graph log"),
	["n|glog"] = map_cr("G log --oneline --decorate --graph"):with_noremap():with_silent():with_desc("git: online log"),
	["n|glol"] = map_cr('G log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"')
		:with_noremap()
		:with_silent()
		:with_desc("git: pretty log"),
	["n|<leader>G"] = map_cu("Git"):with_noremap():with_silent():with_desc("git: Open git-fugitive"),
	---- subkeymap in vim-fugitive:
	---- '-' : stage or unstage the file under the cursor
	---- 'U' : unstage everything
	---- 'X' : discard changes
	---- 'dv' : gvdiff with HEAD~1
	---- 'dh' : ghdiff with HEAD~1
	---- 'dq' : close the diff
	---- 'o' : open file horizontal
	---- 'gO' : open file vertical
	---- 'C' : Open the commit containing the current file
	---- 'gu' : Jump to "Untracked" section
	---- 'gp' : Jump to "Unpushed" section
	---- 'gU' : Jump to "Unstaged" section
	---- 'gs' : Jump to "Staged" section
	---- 'gI' : add current file to .gitignore
	---- 'gi' : open .gitignore file
	---- 'cc' : Create a commit
	---- 'ca' : Amend the last commit and edit the message

	-- Plugin: nvim-tree
	["n|<leader>e"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),
	---- subkeymap in nvim-tree:
	---- see ../modules/configs/tool/nvim-tree.lua:26

	-- Plugin: sniprun
	["v|<leader>sr"] = map_cr("SnipRun"):with_noremap():with_silent():with_desc("tool: Run code by range"),
	["n|<leader>sr"] = map_cu([[%SnipRun]]):with_noremap():with_silent():with_desc("tool: Run code by file"),

	-- Plugin: toggleterm
	["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["n|<C-\\>"] = map_cr("ToggleTerm direction=horizontal")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle horizontal"),
	["i|<C-\\>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle horizontal"),
	["t|<C-\\>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle horizontal"),
	["n|<A-\\>"] = map_cr("ToggleTerm direction=vertical")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["i|<A-\\>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["t|<A-\\>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
	["n|<F5>"] = map_cr("ToggleTerm direction=vertical")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["i|<F5>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["t|<F5>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
	["n|<A-d>"] = map_cr("ToggleTerm direction=float"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
	["i|<A-d>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["t|<A-d>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),

	-- Plugin: Trouble
	["n|gt"] = map_cr("Trouble diagnostics toggle"):with_noremap():with_silent():with_desc("lsp: Toggle trouble list"),
	["n|<leader>lw"] = map_cr("Trouble diagnostics toggle")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show workspace diagnostics"),
	["n|<leader>lp"] = map_cr("Trouble project_diagnostics toggle")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show project diagnostics"),
	["n|<leader>ld"] = map_cr("Trouble diagnostics toggle filter.buf=0")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show document diagnostics"),

	-- Plugin: buffer_manager
	["n|<leader>b"] = map_cr("lua require('buffer_manager.ui').toggle_quick_menu()")
		:with_noremap()
		:with_silent()
		:with_desc("buffer: Toggle buffer manager"),

	-- Plugin: telescope
	["n|<C-p>"] = map_callback(function()
			_command_panel()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
	["n|<leader>fc"] = map_callback(function()
			_telescope_collections(require("telescope.themes").get_dropdown())
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Open Telescope collections"),
	["n|<leader>ff"] = map_callback(function()
			require("search").open({ collection = "file" })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Find files"),
	["n|<leader>fp"] = map_callback(function()
			require("search").open({ collection = "pattern" })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Find patterns"),
	["v|<leader>fs"] = map_cu("Telescope grep_string")
		:with_noremap()
		:with_silent()
		:with_desc("tool: Find word under cursor"),
	["n|<leader>fg"] = map_callback(function()
			require("search").open({ collection = "git" })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Locate Git objects"),
	["n|<leader>fd"] = map_callback(function()
			require("search").open({ collection = "dossier" })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Retrieve dossiers"),
	["n|<leader>fm"] = map_callback(function()
			require("search").open({ collection = "misc" })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Miscellaneous"),
	---- subkeymap in telescope:
	---- see ../modules/configs/tool/telescope.lua:45

	-- Plugin: dap
	["n|<F6>"] = map_callback(function()
			require("dap").continue()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run/Continue"),
	["n|<F7>"] = map_callback(function()
			require("dap").terminate()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Stop"),
	["n|<F8>"] = map_callback(function()
			require("dap").toggle_breakpoint()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle breakpoint"),
	["n|<F9>"] = map_callback(function()
			require("dap").step_into()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step into"),
	["n|<F10>"] = map_callback(function()
			require("dap").step_out()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step out"),
	["n|<F11>"] = map_callback(function()
			require("dap").step_over()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step over"),
	["n|<leader>db"] = map_callback(function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Set breakpoint with condition"),
	["n|<leader>dc"] = map_callback(function()
			require("dap").run_to_cursor()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run to cursor"),
	["n|<leader>dl"] = map_callback(function()
			require("dap").run_last()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run last"),
	["n|<leader>do"] = map_callback(function()
			require("dap").repl.open()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Open REPL"),
}

bind.nvim_load_mapping(plug_map)
