local root_files = {'.git', '__init__.py', '__main__.py', 'requirements.txt'}
local paths = vim.fs.find(root_files, {stop = vim.env.HOME})
local root_dir = vim.fs.dirname(paths[1])
vim.print("Root dir: " .. root_dir)

if root_dir then
	vim.lsp.start({
		name = "python-lsp-server",
		cmd = { "pylsp"},
		root_dir = root_dir,
	})
end
