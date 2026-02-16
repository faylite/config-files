-- Pick provider via env var:
--   CODECOMPANION_PROVIDER=copilot   -> use GitHub Copilot
--   CODECOMPANION_PROVIDER=gradient  -> use DigitalOcean Gradient AI
-- default: gradient

return {
	{ -- AI Chat
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{
				"zbirenbaum/copilot.lua",
				enabled = function()
					return (vim.env.CODECOMPANION_PROVIDER or "gradient"):lower() == "copilot"
				end,
				cmd = "Copilot",
				event = "VeryLazy",
				opts = {
					suggestion = { enabled = false },
					panel = { enabled = false },
				},
			},
		},
		config = function()
			local provider = (vim.env.CODECOMPANION_PROVIDER or "gradient"):lower()
			local default_adapter = (provider == "copilot") and "copilot" or "do_gradient"

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
					copilot = function()
						return require("codecompanion.adapters").extend("copilot", {})
					end,
				},
				interactions = {
					chat = { adapter = default_adapter },
					inline = { adapter = default_adapter },
					cmd = { adapter = default_adapter },
				},
			})
		end,
	},
}
