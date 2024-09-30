return {
	"mfussenegger/nvim-lint",
	event = "User FilePost",
	opts = {
		-- Event to trigger linters
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			fish = { "fish" },

			typescript = { "eslint_d" },
			javascript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascriptreact = { "eslint_d" },
		},
		linters = {},
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd(opts.events, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
