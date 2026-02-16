return {
	{ -- AI Chat
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				adapters = {
					http = {
						do_gradient = function()
							return require("codecompanion.adapters").extend("openai_compatible", {
								env = {
									api_key = "DIGITALOCEAN_MODEL_ACCESS_KEY",
									url = "https://inference.do-ai.run",
								},
								schema = {
									model = {
										default = "llama3.3-70b-instruct",
									},
								},
							})
						end,
					},
				},
				interactions = {
					chat = { adapter = "do_gradient" },
					inline = { adapter = "do_gradient" },
					cmd = { adapter = "do_gradient" },
				},
			})
		end,
	},
}
