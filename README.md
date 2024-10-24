# NeoVim personal requirements

- [x] Base distro / environment
    - [x] Kickstart
- [ ] UI
    - [x] Improved font
        - `https://github.com/ryanoasis/nerd-fonts`
    - [x] Theme
        - `Mofiqul/vscode.nvim`
    - [ ] Icons (warning, error, explorer filetypes etc)
    - [x] Line Numbers
        - `vm.wo.number = true`
    - [x] Relative Line numbers
        - `vim.wo.relativenumber = true`
    - [ ] Tab size
    - [ ] Split view
        - [x] Create view (vert/hor)
            - `[C-w] + v/s`
        - [x] Quick switch to view
            - `[C-w] + hjkl`
        - [ ] Open in view (file, definition etc)
        - [x] Close a view
            - `[C-w] + q`
    - [x] Lateral Explorer (NVChad C-n like?)
        - `<leader>E` / `:NvimTreeOpen`
    - [x] Key bindings suggestions
        - `which-key`
    - [x] Search key bindings
        - `<leader> ss` => `keymaps`
- [ ] IDE Features
    - [ ] Fuzzy search
    - [ ] LSP
        - [x] C++
        - [x] CMake
        - [x] Rust
        - [x] Toml
        - [x] C#
        - [ ] PlantUML
        - [ ] Typescript
        - [ ] Parameters inlay hints
        - [ ] Auotocomplete function parameters / signature parameter hover (hrsh7th/nvim-cmp ?)
    - [ ] Build ?
    - [ ] Run target ?
    - [ ] Debug ?
    - [ ] Git integration
    - [ ] Format
        - [x] on demand
            - `:Format`
        - [ ] on save    
    - [ ] Navigation
        - [x] Go to definition
            - `gd`
        - [x] Go to declaration
            - `gD`
        - [ ] Go to file
        - [x] Go back
            - `[C-o]`
        - [x] Go to references
            - `gr`
        - [x] Hover documentation
            - `K`
        - [x] Hover debug evaluate
            - `:lua require("dapui").eval()` 1x to open, 2x to switch focus
        - [x] Comment / uncomment 
            - `gcc` : current line
            - `gbc` : block
            - more options unde `gc`
        - [x] Code action
            - `<leader>ca`
        - [x] Find by symbol
            - `<leader>ws`
        - [ ] Jump between warnings / errors ?
            - `folke/trouble.nvim` ?
        - [ ] Recently used files / buffers etc
        - [x] Access Explorer (sidebar)
            - `nvim-tree` package
            - `<leader>E`
        - [x] New file
            - `:edit <FILE>`
        - [ ] Go to path (with autocomplete)
        - [x] Search by file name
            - `<leader>sf`
        - [x] Search Git tracked by file name
            - `<leader>gf`
        - [ ] Search by content (also in git ? )
    - [ ] Show current method location ? (Class::method)
    - [ ] Project specific configurations ?
    - [ ] Language specific integration
        - [ ] Rust
            - [x] rust-analyzer
            - [x] Debug
                - `:RustLsp debuggables`
        - [ ] C++
            - [x] CMake
            - [x] Switch source/header
                - `:ClangdSwitchSourceHeader`
            - [ ] clangformat (included already via clangd?)
            - [x] Debug
                - `:DapToggleBreakpoint`
                - `:DapContinue`
            - [x] clangd
                - [x] Fix auto include
        - [ ] C#
            - [x] LSP
                - `omnisharp` Mason LSP
            - [x] Debug
                - `netcoredbg`
                - same debugging commands as for C++, but first needs manual build via `:!dotnet build` and specify dll path for second command, not binary !!!
```
mason_lspconfig.setup_handlers {
  function(server_name)
    ...
    require('lspconfig').clangd.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
      cmd = {"clangd", "--header-insertion=never"},
    }
  end,
}
```

- [ ] Nice to have
    - [ ] `nvim-dap-virtual-text`
    - [ ] undotree
    - [x] tree-sitter
    - [ ] harpoon ? 
    - [ ] git-fugitive ?
    - [x] hop (quick jump) ?
        - `<leader>ff`
    - [ ] lsp-zero ?
    - [ ] Central input floating window (LazyVim like) ?
- [ ] Misc
    - [x] Source current config for debugging
        - `:so`
    - [ ] tree-sitter playground (see abstract syntax tree of the file) ?
    - [x] Repeat last command
        - `[#].`
    - [x] Extract buffer to a tab
        - `[C-w]T`
        - Switch tabs `gt/T`
