local global = {}
local os_name = vim.loop.os_uname().sysname

function global:load_variables()
	self.is_mac = os_name == "Darwin"
	self.is_linux = os_name == "Linux"
	self.is_windows = os_name == "Windows_NT"
	self.is_wsl = vim.fn.has("wsl") == 1
	self.vim_path = vim.fn.stdpath("config")
	self.cache_dir = vim.fn.stdpath("cache")
	self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
	self.modules_dir = self.vim_path .. "/modules"
	self.home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
end

function global:open_file_at_line()
	local current_file_directory = vim.fn.expand("%:p:h")
	local fileline = vim.fn.expand("<cWORD>")
	local absl_path = current_file_directory .. "/" .. fileline
	local file, line = absl_path:match("^(.*):(%d+)$")

	if file and line then
		vim.cmd("edit " .. file)
		vim.cmd(line)
	else
		vim.cmd("edit " .. fileline)
	end
end

global:load_variables()

return global
