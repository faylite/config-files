return {
	{ -- Auto configures indent method based on the current buffer indent style
		"NMAC427/guess-indent.nvim",
		opts = {},
	},
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {},
		opts = {
			notify_on_error = false,
			format_on_save = function()
				return nil
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "pint" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
