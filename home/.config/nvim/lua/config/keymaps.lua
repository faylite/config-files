local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

--- The great escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Toggle search keyword highlights")
map("i", "jj", "<Esc>", "Escape from insert mode")

--- TODO: Replace
map("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

-- Plugins

do --- AI
	map("n", "<leader>cc", ":CodeCompanionChat<CR>", "[C]odeCompanion [C]hat")
	map("n", "<leader>ca", ":CodeCompanionActions<CR>", "[C]odeCompanion [A]ctions")
end

do --- File Explorer
	map("n", "<leader>n", function()
		require("nvim-tree.api").tree.toggle()
	end, "[N]vimTree Toggle")

	map("n", "<C-CR>", function()
		require("nvim-tree.api").tree.change_root_to_node()
	end, "Go into directory")
end

do --- Terminal
	map("t", "<Esc>", "<C-\\><C-n>", "Exit [T]erminal mode")
	map("n", "<leader>t", function()
		require("toggleterm").toggle(1, nil, nil, "horizontal", "main")
	end, "Toggle [T]erminal (Main)")
end

do --- Code wrangling
	map("n", "<leader>k", function()
		require("conform").format({ async = true, lsp_format = "fallback" })
	end, "[K]ode Format")
end

do --- Code navigation
	map("n", "<leader>f", ":Telescope<CR>", "Telescope")

	map("n", "<leader>ff", function()
		require("telescope.builtin").find_files()
	end, "[F]uzzy [F]ile")

	map("n", "<leader>fs", function()
		require("telescope.builtin").live_grep()
	end, "[F]uzzy [S]earch")

	map("n", "<leader>fb", function()
		require("telescope.builtin").buffers()
	end, "[F]uzzy [B]uffers")

	map("n", "<leader>fh", function()
		require("telescope.builtin").help_tags()
	end, "[F]uzzy [H]elp tags")

	map("n", "<leader>fu", function()
		require("telescope.builtin").diagnostics()
	end, "[F]uzzy [U]ps")

	map("n", "<leader>jd", vim.lsp.buf.definition, "[J]ump to [D]efinition")

	map("n", "<leader>ji", function()
		require("telescope.builtin").lsp_implementations()
	end, "[J]ump to [I]mplementation")

	map("n", "<leader>jh", vim.lsp.buf.hover, "[J]ump to [H]elp")
	map("n", "<M-CR>", vim.lsp.buf.code_action, "Code Action")
end
