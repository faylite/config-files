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
	local api = require("nvim-tree.api")
	map("n", "<leader>n", api.tree.toggle, "[N]vimTree Toggle")
	map("n", "<C-CR>", api.tree.change_root_to_node, "Go into directory")
end

do --- Terminal
	local api = require("toggleterm")

	local function term_toggle()
		api.toggle(1, nil, nil, "horizontal", "main")
	end

	map("t", "<Esc>", "<C-\\><C-n>", "Exit [T]erminal mode")
	map("n", "<leader>t", term_toggle, "Toggle [T]erminal (Main)")
end

do --- Code wrangling
	local conform = require("conform")
	local function fmt()
		return conform.format({ async = true, lsp_format = "fallback" })
	end

	map("n", "<leader>k", fmt, "[K]ode Format")
end

do --- Code navigation
	local builtin = require("telescope.builtin")
	map("n", "<leader>f", ":Telescope<CR>", "Telescope")
	map("n", "<leader>ff", builtin.find_files, "[F]uzzy [F]ile")
	map("n", "<leader>fs", builtin.live_grep, "[F]uzzy [S]earch")
	map("n", "<leader>fb", builtin.buffers, "[F]uzzy [B]uffers")
	map("n", "<leader>fh", builtin.help_tags, "[F]uzzy [H]elp tags")
	map("n", "<leader>fu", builtin.diagnostics, "[F]uzzy [U]ps")

	map("n", "<leader>jd", vim.lsp.buf.definition, "[J]ump to [D]efinition")
	map("n", "<leader>ji", builtin.lsp_implementations, "[J]ump to [I]mplementation")
	map("n", "<leader>jh", vim.lsp.buf.hover, "[J]ump to [H]elp")
	map("n", "<M-CR>", vim.lsp.buf.code_action, "Code Action")
end
