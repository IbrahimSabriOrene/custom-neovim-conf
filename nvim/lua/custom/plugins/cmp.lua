return{
'hrsh7th/cmp-nvim-lsp',
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		'SirVer/ultisnips',
		'quangnguyen30192/cmp-nvim-ultisnips'
		},

	config = function()
	local cmp = require("cmp")
	vim.opt.completeopt = { "menu", "menuone", "noselect" }
	local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
	cmp.setup({
		snippet = {
			expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
			end,
			requires = { "nvim-treesitter/nvim-treesitter" },
		},
			enabled = true,
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(
			function(fallback)
		            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
			end,
			{ "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
			),
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "ultisnips" }, -- For luasnip users.
			-- { name = "orgmode" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

}
