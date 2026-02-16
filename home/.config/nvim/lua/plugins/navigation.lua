return {
	{ -- Directory browser
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{ -- Fuzzy finder
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{ -- Terminal
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = function(term)
				if term.direction == "horizontal" then
					return vim.o.lines * 0.8
				else
					return vim.o.columns * 0.4
				end
			end,
			start_in_insert = false,
		},
	},
}
