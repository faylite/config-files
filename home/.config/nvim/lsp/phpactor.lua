return {
	cmd = { "phpactor", "language-server" },
	filetypes = { "php", "origami" },
	root_markers = { "composer.json", ".phpactor.json", ".phpactor.yml" },
	workspace_required = true,
	init_options = {
		["indexer.follow_symlinks"] = true,
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = false,
		["ini.memory_limit"] = "1G",
	},
}
