return{
"akinsho/toggleterm.nvim",
  -- size can be a number or function which is passed the current terminals

config = function()
require("toggleterm").setup{

open_mapping = [[<c-t>]],
hide_numbers = true,
shade_filetypes={},
shade_terminals = true,
shading_factor = 2,
start_in_insert = true,
persist_size=true,
direction = "float",
close_on_exit = true,
shell = vim.o.shell,
float_opts= {
	border = "curved",
	winblend = 0,
	highlights = {
		border = "Normal",
		background = "Normal",
		},
	},
}
end,
}
