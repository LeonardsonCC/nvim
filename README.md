# My Neovim Configuration

## Why Neovim?
- Because LSP is way better than COC;
- Lua is better than VimLanguage;
- Lua plugins are awesome;
- Treesitter is great;

## Install
- Clone the repository;
- Install [Packer](https://github.com/wbthomason/packer.nvim) manually;
- Run `nvim +PackerSync` to download all plugins;
- Be sure the LSP you'll use is installed using `:LspInstallInfo`, and configured in `after/plugin/lsp.lua`;

## Improvements
- Automatically get the LspInstall installations and setup the LSP;
- Script to install Packer and all dependencies automatically;
- Any cool plugin found on the internet;

