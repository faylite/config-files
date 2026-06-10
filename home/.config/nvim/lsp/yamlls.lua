--- @type vim.lsp.Config
return {
	settings = {
		yaml = {
			schemas = {
				["./.sugoi/app.schema.json"] = "/app.*yml",
			}
		}
	},
	on_init = function(client)
		local root_dir = client.config.root_dir
		if not root_dir then return end

		local schema_path = root_dir .. "/.sugoi/app.schema.json"

		-- Start a native file system event watcher for the generated schema file
		local fs_event = vim.uv.new_fs_event()
		if fs_event then
			fs_event:start(schema_path, {}, vim.schedule_wrap(function(err)
				if err then return end

				-- Notify yamlls of a config change, which forces it to flush its schema cache and reload
				client.notify("workspace/didChangeConfiguration", {
					settings = client.config.settings
				})
			end))
		end
	end,
}
