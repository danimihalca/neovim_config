# NeoVim personal requirements

- [x] Base distro / environment
    - [x] Kickstart
- [ ] UI
    - [x] Improved font
        - `https://github.com/ryanoasis/nerd-fonts`
    - [ ] Theme
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
    - [ ] Lateral Explorer (NVChad C-n like?)
    - [x] Key bindings suggestions
        - `which-key`
    - [x] Search key bindings
        - `:Telescope` => `keymaps`
        - `<leader> ss:w`
- [ ] IDE Features
    - [ ] Fuzzy search
    - [ ] LSP
        - [x] C++
        - [ ] Rust
        - [ ] PlantUML
        - [ ] Typescript
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
        - [ ] Popup documentation
        - [ ] Code action
        - [ ] Jump between warnings / errors ?
        - [ ] Recently used files / buffers etc
        - [x] Access Explorer (sidebar)
            - `nvim-tree` package
            - `<leader>E`
        - [x] New file
            - `:edit <FILE>`
        - [ ] Go to path (with autocomplete)
        - [x] Search by file name
            - `<leader>sf`
        - [ ] Search by file name in Git files
        - [ ] Search by content (also in git ? )
    - [ ] Show current method location ? (Class::method)
    - [ ] Project specific configurations ?
    - [ ] Language specific integration
        - [ ] C++
            - [x] CMake
            - [x] Switch source/header
                - `ClangdSwitchSourceHeader`
            - [ ] clangformat
        - [ ] Rust
            - [ ] rust-analyzer
            - [ ] clangd
                - [x] Fix auto include
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
    - [ ] undotree
    - [ ] tree-sitter
    - [ ] harpoon ? 
    - [ ] git-fugitive ?
    - [ ] lsp-zero ?
- [ ] Misc
    - [x] Source current config for debugging
        - `:so`
    - [ ] tree-sitter playground (see abstract syntax tree of the file) ?

