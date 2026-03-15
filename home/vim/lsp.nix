{ ... }:

{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        gopls.enable = true;
        pyright.enable = true;
        nixd.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
      };

      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "declaration";
        "gr" = "references";
        "gi" = "implementation";
        "K"  = "hover";
        "<leader>rn" = "rename";
        "<leader>ca" = "code_action";
      };
    };

    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };
    };

    none-ls = {
      enable = true;
      sources.formatting = {
        alejandra.enable = true;      # Nix
        black.enable = true;          # Python
        gofmt.enable = true;          # Go
        clang_format.enable = true;   # C/C++
      };
    };

    lsp-format.enable = true;
    aerial.enable = true;
    fidget.enable = true;
    luasnip.enable = true;
  };
}
