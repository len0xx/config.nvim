# config.nvim

My minimal and powerful NeoVim configuration

(Looking relatively similar to modern IDEs)

## Screenshots

![image](https://user-images.githubusercontent.com/21990466/221374532-7527f6b5-20f2-4d39-8567-d470110793fd.png)

![image](https://user-images.githubusercontent.com/21990466/221374460-b2beb1e8-e669-44a8-8659-35f72f7b5503.png)

## Get started

### Prerequisites

**To use this config you first need to install NeoVim**. ([Installation guide](https://github.com/neovim/neovim/wiki/Installing-Neovim))

Additionally you will need Packer and LazyGit. Both of which may be installed using the scripts from this repository (`install-config.sh` and `install-lazygit-linux-x86_64.sh`)

Each Language Server Protocol (LSP for short) is using its own Language Server, so for each language you also need to install a Language Server Daemon. Check out [this guide](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) for more info

NeoVim uses a lot of so called "nerd" characters, so you will most likely need those to be installed [from here](https://github.com/ryanoasis/nerd-fonts).

The font that I use is `Fira Code`

### Installation (*nix)

Currently the installation process is only described for Unix-like systems

1. To get started with this config use these commands:
```bash
git clone https://github.com/len0xx/config.nvim
cd config.nvim
chmod +x install-config.sh
./install-config.sh
```

2. If you don't have LazyGit installed yet, use these commands (assuming that you have this repository cloned by running the previous commands) (**It only works for Linux x86_64**. To install it on other systems check out [this page](https://github.com/jesseduffield/lazygit)):
```bash
chmod +x install-lazygit-linux-x86_64.sh
./install-lazygit-linux-x86_64.sh
```

3. After everything has been installed, launch NeoVim with this command: `nvim test.txt`. Now to install the package dependencies, run this command inside of NeoVim: `:PackerInstall`

4. Now restart NeoVim and you should be ready to go!

## Description

### General plugins

- Telescope [Fuzzy finder]
- TreeSitter [Syntax highlight and more]
- GitSigns [Super fast git decorations]
- LuaLine [Statusline]
- Nvim-Tree [Tree viewer]
- Bufferline [Tabs]
- ToggleTerm [Terminal windows inside neovim]

### LSP
- Nvim-Lspconfig
- Mason
- Mason-Lspconfig
- Nvim-Cmp
- Cmp-Path
- Cmp_Luasnip
- Cmp-Nvim-Lsp
- Cmp-Nvim-Lua
- Cmp-Buffer
- Vim-Vsnip
- Vim-SQL-Syntax

### Language support
- TS [+ JS]
- Svelte
- Vue
- HTML, CSS
- Rust
- Vim
- Lua
- SQL
- C/C++
- PHP
- Python
 
### Theme
GitHub Dark Default [[Link](https://github.com/projekt0n/github-nvim-theme)]
 
### Keybindings
- <Ctrl + S> - live search by file content [Normal mode]
- <Ctrl + F> - search files by its name [Normal mode]
- <Ctrl + G> - Git UI (lazygit) [Normal mode]
- <Ctrl + R> - open the floating terminal window [Normal mode]
- <Ctrl + R> + B - open the terminal window horizontally [Normal mode]
- <Ctrl + R> + R - open the terminal window vertically [Normal mode]
- g + d - go to definition [Normal mode]
- g + D - go to declaration [Normal mode]
- K - hover [Normal mode]
- Space + rn - rename [Normal mode]
