-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local map = vim.keymap.set

local on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
	map("n", "gr", vim.lsp.buf.references, opts("Show references"))

	map("n", "<leader>cd", vim.diagnostic.open_float, opts("Show Diagnostic"))
	map("n", "<leader>cs", vim.lsp.buf.signature_help, opts("Show signature help"))
	map("n", "<leader>cwa", vim.lsp.buf.add_workspace_folder, opts("[C]ode [W]orkspace [A]dd Folder"))
	map("n", "<leader>cwr", vim.lsp.buf.remove_workspace_folder, opts("[C]ode [W]orkspace [R]emove Folder"))
	map("n", "<leader>cwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))
	map("n", "<leader>cr", function()
		require("nvchad.lsp.renamer")()
	end, opts("NvRenamer"))
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
end

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = {
	"html",
	"cssls",
	"gopls",
	"vtsls",
	"terraformls",
	"intelephense",
}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
