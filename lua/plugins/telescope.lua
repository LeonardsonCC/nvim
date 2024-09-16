return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]eymaps" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
		{
			"<leader>sa",
			"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
			desc = "[S]earch [A]ll file",
		},
		{ "<leader>ss", "<cmd>Telescope builtin<cr>", desc = "[S]earch [S]elect Telescope" },
		{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
		{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "[S]earch [R]esume" },
		{ "<leader>s.", "<cmd>Telescope oldfiles<cr>", desc = '[S]earch Recent Files ("." for repeat)' },
		{ "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers" },
	},
	opts = function()
		local conf = require("nvchad.configs.telescope")

		conf.defaults.mappings.i = {
			["<C-j>"] = require("telescope.actions").move_selection_next,
			["<Esc>"] = require("telescope.actions").close,
		}

		return conf
	end,
}
