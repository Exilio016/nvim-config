local root_files = { '.git', 'node_modules', 'package.json' }
local paths = vim.fs.find(root_files, { upwords = true })
local root_dir = vim.fs.dirname(paths[1])
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)

if root_dir then
    vim.lsp.start({
        name = "html-server",
        cmd = { "vscode-html-language-server", "--stdio" },
        root_dir = root_dir,
        capabilities = capabilities,
        single_file_support = true,
        init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
                css = true,
                javascript = true
            },
            provideFormatter = true
        }
    })
    vim.lsp.start({
        name = "htmx-server",
        cmd = { "/home/k8s/.cargo/bin/htmx-lsp" },
        root_dir = root_dir,
        capabilities = capabilities,
        single_file_support = true,
    })
    vim.lsp.start({
        name = "tailwind-server",
        cmd = { 'tailwindcss-language-server', '--stdio' },
        root_dir = root_dir,
        capabilities = capabilities,
        single_file_support = true,
        settings = {
            tailwindCSS = {
                validate = true,
                lint = {
                    cssConflict = 'warning',
                    invalidApply = 'error',
                    invalidScreen = 'error',
                    invalidVariant = 'error',
                    invalidConfigPath = 'error',
                    invalidTailwindDirective = 'error',
                    recommendedVariantOrder = 'warning',
                },
                classAttributes = {
                    'class',
                    'className',
                    'class:list',
                    'classList',
                    'ngClass',
                },
            },
        },
    })
end
