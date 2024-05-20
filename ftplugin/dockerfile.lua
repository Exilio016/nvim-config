local root_files = {'Dockerfile'}
local paths = vim.fs.find(root_files, {upwords = true})
local root_dir = vim.fs.dirname(paths[1])
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)

if root_dir then
	vim.lsp.start({
		name = "docker-lsp",
		cmd = { "docker-langserver", "--stdio" },
		root_dir = root_dir,
        capabilities = capabilities,
        single_file_support = true,
	})
end
