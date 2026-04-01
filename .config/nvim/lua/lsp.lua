local servers = {
  texlab = {},
  gdscript = {},
  pylsp = {},
  ccls = {},
  gopls = {},
  html = {},
  cssls ={},
  eslint = {},
  ts_ls = {},
  dockerls = {},
  ltex = {
      settings = {
        ltex = {
          language = "ru-RU",
        },
      },
      cmd = {"ltex-ls-plus"},
      autostart = true
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = {"vim"} },
        workspace = {
          checkThirdParty = false,
          telemetry = { enable = false },
          library = {
            "${3rd}/love2d/library"
          }
        }
      }
    }
  },
  racket_langserver = {},
  rust_analyzer = { 
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = false,
        },
        cargo = {
            allFeaturs = true
        }
      }
    }
  }
}
for server,conf in pairs(servers) do
    vim.lsp.config(server,conf)
    vim.lsp.enable(server)
end

vim.diagnostic.config({
  virtual_text = false, 
})
