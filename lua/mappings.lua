require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<", "<gv", { desc = "Indent left" })

map("n", "L", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "H", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
