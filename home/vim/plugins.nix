{...}: {
  programs.nixvim.plugins = {
    # lualine
    lualine.enable = true;

    # bufferline
    bufferline = {
      enable = true;
      settings.options = {
        numbers = "ordinal";
        separator_style = "thin";
        show_buffer_close_icons = false;
      };
    };

    # indent-blankline
    indent-blankline.enable = true;

    # web-devicons
    web-devicons.enable = true;

    # comment
    comment = {
      enable = true;
      settings = {
        toggler.line = "gcc";
        opleader.line = "gc"; # 可视模式下：gc 注释选区
      };
    };

    # vim-surround
    vim-surround.enable = true;

    # fugitive
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

    # telescope
    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fm" = "oldfiles";
        "<leader>fb" = "buffers";
      };
    };

    # treesitter
    treesitter = {
      enable = true;
      settings.ensure_installed = ["nix" "c" "cpp" "lua" "markdown"];
    };

    # neo-tree
    neo-tree.enable = true;

    # hop
    hop.enable = true;

    # visual-multi
    visual-multi.enable = true;

    # markdown-preview
    markdown-preview = {
      enable = true;
      settings = {
        auto_start = 0;
        auto_close = 1;
        refresh_slow = 0;
      };
    };
  };
}
