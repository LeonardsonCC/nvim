return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},
	opts = {
		file_types = { "markdown", "norg", "rmd", "org" },
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		heading = {
			sign = false,
			icons = {},
		},
	},
	ft = { "markdown", "norg", "rmd", "org" },
	config = function(_, opts)
		require("render-markdown").setup(opts)
	end,
}
