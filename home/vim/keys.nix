{ ... }:

{
  programs.nixvim.keymaps = [
    # --- 行首行尾快速跳转 ---
    { mode = [ "n" "v" ]; key = "<Leader>a"; action = "0"; }
    { mode = [ "n" "v" ]; key = "<Leader>e"; action = "$"; }
    { mode = [ "n" "v" ]; key = "<Leader>s"; action = "^"; }

    # --- 剪贴板集成 (强制覆盖系统剪贴板) ---
    { mode = "v"; key = "<Leader>y"; action = "\"+y"; }
    { mode = "n"; key = "<Leader>p"; action = "\"+p"; }

    # --- 退出与保存逻辑 ---
    { mode = "n"; key = "<Leader>qq"; action = ":q<CR>"; options.silent = true; }
    { mode = "n"; key = "<Leader>qa"; action = ":qa<CR>"; options.silent = true; }
    { mode = "n"; key = "<Leader>qb"; action = ":bp|bd#<CR>"; options.silent = true; } # 关闭当前 Buffer 并切回上一个
    { mode = "n"; key = "<Leader>ww"; action = ":w<CR>"; options.silent = true; }
    { mode = "n"; key = "<Leader>wq"; action = ":wa<CR>:q<CR>"; options.silent = true; }
    { mode = "n"; key = "<Leader>Q";  action = ":qa!<CR>"; options.silent = true; }

    # --- Buffer 数字快速切换 (1-0) ---
    { mode = "n"; key = "<Leader>1"; action = ":1b<CR>"; }
    { mode = "n"; key = "<Leader>2"; action = ":2b<CR>"; }
    { mode = "n"; key = "<Leader>3"; action = ":3b<CR>"; }
    { mode = "n"; key = "<Leader>4"; action = ":4b<CR>"; }
    { mode = "n"; key = "<Leader>5"; action = ":5b<CR>"; }
    { mode = "n"; key = "<Leader>6"; action = ":6b<CR>"; }
    { mode = "n"; key = "<Leader>7"; action = ":7b<CR>"; }
    { mode = "n"; key = "<Leader>8"; action = ":8b<CR>"; }
    { mode = "n"; key = "<Leader>9"; action = ":9b<CR>"; }
    { mode = "n"; key = "<Leader>0"; action = ":10b<CR>"; }

    # --- 窗口操作 ---
    { mode = "n"; key = "<leader>w"; action = "<C-W>"; }
    { mode = "n"; key = "<space>w";  action = "<C-W>"; }
    
    # 这一组 Alt+u/d 的逻辑：在两个窗口间同步滚动（跨窗口翻页）
    { mode = "";  key = "<M-u>"; action = "<C-w>p<C-u><C-w>p"; }
    { mode = "";  key = "<M-d>"; action = "<C-w>p<C-d><C-w>p"; }

    # --- 快速 Buffer 导航 ---
    { mode = "n"; key = "<space>p"; action = ":bp<CR>"; }
    { mode = "n"; key = "<space>n"; action = ":bn<CR>"; }

    # neo tree
    { mode = "n"; key = "<leader>ff"; action = ":Neotree toggle<CR>"; }

    # hop
    { mode = "n"; key = "s"; action = ":HopChar1<CR>"; }
    { mode = "n"; key = "<leader>l"; action = ":HopLine<CR>"; }

  ];
}
