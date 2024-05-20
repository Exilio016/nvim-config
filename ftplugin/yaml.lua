local root_files = {'.git', 'ansible.cfg', '.ansible-lint'}
local paths = vim.fs.find(root_files, {upwords = true})
local root_dir = vim.fs.dirname(paths[1])
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)

--vim.lsp.start({
--    name = "yaml-lsp",
--    cmd = { "yaml-language-server", "--stdio" },
--    root_dir = root_dir,
--    capabilities = capabilities,
--    single_file_support = true,
--    settings = {
--        redhat = { telemetry = { enabled = false } },
--        yaml = {
--            schemas = {
--                ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.yaml",
--            },
--        },
--    },
--})
