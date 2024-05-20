local jdtls = require('jdtls')
local root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)
local config = {
	name = "jdtls",
	cmd = {'/opt/jdtls/bin/jdtls', '--configuration', '/opt/jdtls/config_linux', '--data', root_dir},
	root_dir = root_dir,
	capabilities = capabilities,
    init_options = {
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
        bundles = {
            '/mnt/c/Projects/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar'
        },
    },
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-11",
						path = "/usr/lib/jvm/java-11-openjdk-amd64/bin/java",
					},
					{
						name = "JavaSE-1.8",
						path = "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java",
					},
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-17-openjdk-amd64/bin/java",
                    },

				},
                updateBuildConfiguration = "interactive",
			},
		},
	},
}
config.on_attach = function(client, bufnr)
    jdtls.setup_dap({hotcodereplace = 'auto'})
    jdtls.setup.add_commands()
end

jdtls.start_or_attach(config)
