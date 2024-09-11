return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
	},
	keys = function()
		return {
			{ "<leader>tf", "<cmd>Oil<cr>", desc = "File Manager" },
			{ "-", "<cmd>Oil<cr>", desc = "File Manager" },
		}
	end,
}
