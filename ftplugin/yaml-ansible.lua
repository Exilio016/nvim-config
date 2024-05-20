local root_files = {'.git', 'ansible.cfg', '.ansible-lint'}
local paths = vim.fs.find(root_files, {upwords = true})
local root_dir = vim.fs.dirname(paths[1])
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)

vim.lsp.start({
	name = "ansible-lsp",
	cmd = { "ansible-language-server", "--stdio" },
	root_dir = root_dir,
    single_file_support = true,
    capabilities = capabilities,
    settings = {
      ansible = {
        python = {
          interpreterPath = 'python',
        },
        ansible = {
          path = 'ansible',
        },
        executionEnvironment = {
          enabled = false,
        },
        validation = {
          enabled = true,
          lint = {
            enabled = true,
            path = 'ansible-lint',
          },
        },
      },
    },
})
