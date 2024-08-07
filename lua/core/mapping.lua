local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local core_map = {
	-- Suckless
	["n|<S-Tab>"] = map_cr("normal za"):with_noremap():with_silent():with_desc("edit: Toggle code fold"),
	["n|<C-s>"] = map_cu("write"):with_noremap():with_silent():with_desc("edit: Save file"),
	["n|Y"] = map_cmd("y$"):with_desc("edit: Yank text to EOL"),
	["n|D"] = map_cmd("d$"):with_desc("edit: Delete text to EOL"),
	["n|H"] = map_cmd("^"),
	["n|L"] = map_cmd("g_"),
	["n|<leader>q"] = map_cmd(":q!<CR>"),
	["n|<leader>w"] = map_cmd(":w<CR>"),
	["n|n"] = map_cmd("nzzzv"):with_noremap():with_desc("edit: Next search result"),
	["n|N"] = map_cmd("Nzzzv"):with_noremap():with_desc("edit: Prev search result"),
	["n|J"] = map_cmd("mzJ`z"):with_noremap():with_desc("edit: Join next line"),
	["n|<Esc>"] = map_callback(function()
			_flash_esc_or_noh()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("edit: Clear search highlight"),
	["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap():with_desc("window: Focus left"),
	["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap():with_desc("window: Focus right"),
	["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap():with_desc("window: Focus down"),
	["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap():with_desc("window: Focus up"),
	["t|<C-w>h"] = map_cmd("<Cmd>wincmd h<CR>"):with_silent():with_noremap():with_desc("window: Focus left"),
	["t|<C-w>l"] = map_cmd("<Cmd>wincmd l<CR>"):with_silent():with_noremap():with_desc("window: Focus right"),
	["t|<C-w>j"] = map_cmd("<Cmd>wincmd j<CR>"):with_silent():with_noremap():with_desc("window: Focus down"),
	["t|<C-w>k"] = map_cmd("<Cmd>wincmd k<CR>"):with_silent():with_noremap():with_desc("window: Focus up"),
	["n|<A-h>"] = map_cr("vertical resize -3"):with_silent():with_desc("window: Resize -3 vertically"),
	["n|<A-l>"] = map_cr("vertical resize +3"):with_silent():with_desc("window: Resize +3 vertically"),
	["n|<A-j>"] = map_cr("resize -3"):with_silent():with_desc("window: Resize -3 horizontally"),
	["n|<A-k>"] = map_cr("resize +3"):with_silent():with_desc("window: Resize +3 horizontally"),
	["n|<A-S-q>"] = map_cr("q!"):with_desc("edit: Force quit"),
	["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"):with_desc("edit: Toggle spell check"),
	["n|<leader>bn"] = map_cu("enew"):with_noremap():with_silent():with_desc("buffer: New"),
	["n|tn"] = map_cr("tabnew"):with_noremap():with_silent():with_desc("tab: Create a new tab"),
	["n|tk"] = map_cr("tabnext"):with_noremap():with_silent():with_desc("tab: Move to next tab"),
	["n|tj"] = map_cr("tabprevious"):with_noremap():with_silent():with_desc("tab: Move to previous tab"),
	["n|to"] = map_cr("tabonly"):with_noremap():with_silent():with_desc("tab: Only keep current tab"),
	-- Insert mode
	["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap():with_desc("edit: Delete previous block"),
	["i|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Move cursor to left"),
	["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap():with_desc("edit: Move cursor to line start"),
	["i|<C-s>"] = map_cmd("<Esc>:w<CR>"):with_desc("edit: Save file"),
	["i|<C-e>"] = map_cmd("<End>"):with_noremap(), -- 光标跳转到行尾
	["i|<C-f>"] = map_cmd("<Right>"):with_noremap(), -- 光标向行尾移动
	["i|<C-d>"] = map_cmd("<Del>"):with_noremap(), -- 光标向后删除-- 另外<C-h> 是光标向前删除
	["i|<C-k>"] = map_cmd("()<Esc>i"):with_noremap(), -- 增加()
	-- Command mode
	["c|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Left"),
	["c|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Right"),
	["c|<C-a>"] = map_cmd("<Home>"):with_noremap():with_desc("edit: Home"),
	["c|<C-e>"] = map_cmd("<End>"):with_noremap():with_desc("edit: End"),
	["c|<C-d>"] = map_cmd("<Del>"):with_noremap():with_desc("edit: Delete"),
	["c|<C-h>"] = map_cmd("<BS>"):with_noremap():with_desc("edit: Backspace"),
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]])
		:with_noremap()
		:with_desc("edit: Complete path of current file"),
	-- Visual mode
	["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("edit: Move this line down"),
	["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("edit: Move this line up"),
	["v|H"] = map_cmd("^"),
	["v|L"] = map_cmd("g_"),
	["v|<"] = map_cmd("<gv"):with_desc("edit: Decrease indent"),
	["v|>"] = map_cmd(">gv"):with_desc("edit: Increase indent"),
	-- 摒弃上下左右键
	["i|<Up>"] = map_cmd("<Nop>"):with_noremap(),
	["i|<Down>"] = map_cmd("<Nop>"):with_noremap(),
	["i|<Left>"] = map_cmd("<Nop>"):with_noremap(),
	["i|<Right>"] = map_cmd("<Nop>"):with_noremap(),
	["v|<Up>"] = map_cmd("<Nop>"):with_noremap(),
	["v|<Down>"] = map_cmd("<Nop>"):with_noremap(),
	["v|<Left>"] = map_cmd("<Nop>"):with_noremap(),
	["v|<Right>"] = map_cmd("<Nop>"):with_noremap(),
	["c|<Up>"] = map_cmd("<Nop>"),
	["c|<Down>"] = map_cmd("<Nop>"),
	["c|<Left>"] = map_cmd("<Nop>"),
	["c|<Right>"] = map_cmd("<Nop>"),
	["c|w!!"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
	-- Windows split
	["n|s"] = map_cmd("<Nop>"),
	["n|sv"] = map_cmd(":vsplit<CR>"),
	["n|sh"] = map_cmd(":split<CR>"),
	["n|st"] = map_cmd(":tabnew<CR>"),
	["n|<Left>"] = map_cmd(":vertical res-5<CR>"),
	["n|<Right>"] = map_cmd(":vertical res+5<CR>"),
	["n|<Up>"] = map_cmd(":res-5<CR>"),
	["n|<Down>"] = map_cmd(":res+5<CR>"),
}

-- 修复p 粘贴文本覆盖的问题
vim.api.nvim_exec(
	[[
xnoremap <expr> p 'pgv"'.v:register.'y'
	]],
	false
)

-- 使得文件跳转可以跳转到指定行
vim.api.nvim_set_keymap(
	"n",
	"gf",
	":lua require('core.global').open_file_at_line()<CR>",
	{ noremap = true, silent = true }
)

bind.nvim_load_mapping(core_map)
