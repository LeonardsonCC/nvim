-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
	tabufline = {
		enabled = false,
	},
	nvdash = {
		load_on_startup = true,
		buttons = {
			{ "  Find File", "Spc s f", "Telescope find_files" },
			{ "  Find All Files", "Spc s a", "Telescope find_files follow=true no_ignore=true hidden=true" },
			{ "󰈚  Recent Files", "Spc s o", "Telescope oldfiles" },
			{ "󰈭  Find Word", "Spc s g", "Telescope live_grep" },
		},
		header = {
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
		},
	},
}

M.base46 = {
	theme = "tokyonight",
	transparency = true,

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
