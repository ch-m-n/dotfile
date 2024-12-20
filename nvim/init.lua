HOME = os.getenv("HOME")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)
--vim.opt.mouse = 'a'

require("oros.options")
require("oros.mappings")
require("oros.autocmd")
require("oros.lazy_plugin")
