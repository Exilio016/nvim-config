local root_files = {'init.lua'}
local paths = vim.fs.find(root_files, {upword = true})
local root_dir = vim.fs.dirname(paths[1])

if root_dir then
	vim.lsp.start({
		name = "luals",
		cmd = {'/opt/lua-lsp/bin/lua-language-server', '--logpath', '/tmp/'},
		root_dir = root_dir,
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT"
                },
                workspace = {
                    library = {
                        vim.env.VIMRUNTIME
                    }
                }
            }
        }
	})
end
