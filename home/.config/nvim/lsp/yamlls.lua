--- @type vim.lsp.Config
return {
	settings = {
		yaml = {
			schemas = {
				["./.sugoi/app.schema.json"] = "/app.*yml",
			}
		}
	},
}
