return {
	{
		name = "sugoi",
		dir = vim.fn.stdpath("config"),
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.filetype.add({
				extension = { ori = "origami" },
			})
			vim.treesitter.language.register("html", "origami")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "origami",
				callback = function(args)
					-- Use the html parser we registered for this filetype
					pcall(vim.treesitter.start, args.buf)

					vim.api.nvim_create_autocmd("FileType", {
						pattern = "origami",
						callback = function(args)
							-- Use the html parser we registered for this filetype (for general HTML highlighting)
							pcall(vim.treesitter.start, args.buf)

							-- Add simple interpolation highlighting (works inside mixed text like: Hello {{ $name }}!)
							-- This is Vim's regex syntax engine, scoped to this buffer only.
							vim.api.nvim_buf_call(args.buf, function()
								vim.cmd([[
syntax clear OrigamiDelim
syntax clear OrigamiInterp
syntax clear OrigamiPhpVar

syntax region OrigamiInterp matchgroup=OrigamiDelim start=/{{#/ end=/#}}/ keepend contains=php_only
syntax region OrigamiInterp matchgroup=OrigamiDelim start=/{{/  end=/}}/  keepend contains=php_only

syntax match OrigamiPhpVar /\$\h\w*/ contained

highlight default link OrigamiDelim Delimiter
highlight default link OrigamiPhpVar Identifier
						]])
							end)
						end,
					})
				end,
			})

			vim.treesitter.query.set(
				"html",
				"injections",
				[[
; Inject PHP inside <s:script> ... </s:script>
(
  (element
    (start_tag
      (tag_name) @tag_name (#match? @tag_name "^s:script$")
    )
    (text) @injection.content
    (end_tag
      (tag_name) @tag_name_end
      (#match? @tag_name_end "^s:script$")
    )
  )
  (#set! injection.language "php_only")
)

; Inject PHP inside Origami operators
(attribute
  (attribute_name) @attr_name (#match? @attr_name "^s:")
  (quoted_attribute_value(attribute_value) @injection.content)
  (#set! injection.language "php_only")
)

; Inject CSS inside <s:style> ... </s:style>
(
  (element
    (start_tag
      (tag_name) @tag_name
      (#match? @tag_name "^s:style$")
    )
    (text) @injection.content
    (end_tag
      (tag_name) @tag_name_end
      (#match? @tag_name_end "^s:style$")
    )
  )
  (#set! injection.language "css")
)
            ]]
			)
		end,
	},
}
