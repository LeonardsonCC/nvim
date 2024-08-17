return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
	},
	keys = function()
		return {
			{ "<leader>tf", "<cmd>Oil<cr>", desc = "File Manager" },
			{ "-", "<cmd>Oil<cr>", desc = "File Manager" },
		}
	end,
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
