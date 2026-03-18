{...}: {
  programs.nixvim.plugins = {
    lualine.enable = true;

    bufferline = {
      enable = true;
      settings.options = {
        numbers = "ordinal";
        separator_style = "thin";
        show_buffer_close_icons = false;
      };
    };

    web-devicons.enable = true;
    indent-blankline.enable = true;

    comment = {
      enable = true;
      settings = {
        toggler.line = "gcc";
        opleader.line = "gc"; # 可视模式下：gc 注释选区
      };
    };

    vim-surround.enable = true;
    fugitive.enable = true;
    gitsigns = {
      enable = true;
      settings.on_attach = ''
        function(bufnr)
          local gs = package.loaded.gitsigns
          -- 跳转到上/下一个修改处 (Hunk)
          vim.keymap.set('n', ']]', gs.next_hunk, { buffer = bufnr })
          vim.keymap.set('n', '[[', gs.prev_hunk, { buffer = bufnr })
          -- 预览当前行的修改内容
          vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
        end
      '';
    };

    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fm" = "oldfiles";
        "<leader>fb" = "buffers";
      };
    };
    treesitter = {
      enable = true;
      settings.ensure_installed = ["nix" "c" "cpp" "lua" "markdown"];
    };

    neo-tree.enable = true;
    hop.enable = true;
    markdown-preview.enable = true;
    visual-multi.enable = true;
  };
}
