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

## Bindings
|Mode   | Keymap 	                    | Description 	        | Category        |
|----   |--------	                    |-------------	        |----------       |
|Normal | gd                            | Go to definition      | LSP             |
|Normal | gD                            | Go to declaration     | LSP             |
|Normal | gi                            | Go to implementation  | LSP             |
|Normal | gr                            | Go to references      | LSP             |
|Normal | &lt;Leader&gt;f               | Format file           | LSP             |
|Normal | K                             | Show hover            | LSP             |
|Normal | ]d/]g                         | Next diagnostic       | LSP             |
|Normal | [d/[g                         | Prev diagnostic       | LSP             |
|Insert | C-h                           | Signature help        | LSP             |
|Normal | &lt;Leader&gt;d               | Show diagnostic       | LSP             |
|Normal | &lt;A-o&gt;                   | Quick menu            | Harpoon         |
|Normal | &lt;A-a&gt;                   | Add file              | Harpoon         |
|Normal | &lt;A-n&gt;                   | Next file             | Harpoon         |
|Normal | &lt;A-p&gt;                   | Prev file             | Harpoon         |
|Normal | &lt;Leader&gt;&lt;Leader&gt;  | Prev file             | Harpoon         |
