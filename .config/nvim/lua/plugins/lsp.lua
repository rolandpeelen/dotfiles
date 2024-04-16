return {
        {
                "williamboman/mason.nvim",
                config = function()
                        require("mason").setup()
                end,
        },
        {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                        require("mason-lspconfig").setup({
                                ensure_installed = {
                                        "lua_ls",
                                        "rescriptls",
                                        "rust_analyzer",
                                        "sqlls",
                                        "tsserver",
                                        "hls",
                                        "cssls",
                                        "bashls",
                                        "swift_mesonls",
                                        "elixirls"
                                },
                        })
                end,
        },
        {
                "neovim/nvim-lspconfig",
                config = function(_, opts)
                        local lspconfig = require("lspconfig")
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()

                        lspconfig.lua_ls.setup({ capabilities = capabilities })
                        lspconfig.rescriptls.setup({ capabilities = capabilities })
                        lspconfig.rust_analyzer.setup({ capabilities = capabilities })
                        lspconfig.sqlls.setup({ capabilities = capabilities })
                        lspconfig.tsserver.setup({ capabilities = capabilities })
                        lspconfig.hls.setup({ capabilities = capabilities })
                        lspconfig.elixirls.setup({
                                cmd = { "/Users/rwjpeelen/.local/share/nvim/mason/bin/elixir-ls" },
                                filetypes = { "ex", "exs", "elixir" },
                                root_dir = lspconfig.util.root_pattern("mix.exs"),
                                capabilities = capabilities,
                        })
                        lspconfig.cssls.setup({ capabilities = capabilities })
                        lspconfig.bashls.setup({ capabilities = capabilities })
                        lspconfig.ocamllsp.setup({ capabilities = capabilities })
                        lspconfig.swift_mesonls.setup({
                                filetypes = { "swift" },
                                capabilities = capabilities,
                        })
                        lspconfig.ocamllsp.mason = false

                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                        vim.keymap.set("n", "ge", vim.diagnostic.open_float, {})
                        vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {})
                        vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
                        vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
                        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
                        vim.keymap.set("n", "<CR>", vim.lsp.buf.hover, {})
                end,
        },
}
