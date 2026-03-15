{
  pkgs,
  ...
}:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = ";";
    #colorschemes.tokyonight.enable = true;

    colorscheme = "molokai";
    extraPlugins = [ pkgs.vimPlugins.molokai ];

    opts = {
      number = true;
      #relativenumber = true;
      shiftwidth = 4;
      softtabstop = 4;
      tabstop = 4;
      expandtab = true;
      smarttab = true;
      smartindent = true;
      autoindent = true;

      cursorline = true;
      #laststatus = 2;
      scrolloff = 7;
      ruler = true;
      conceallevel = 0;
      
      wrap = false;
      linebreak = true;
      #textwidth = 80;
      colorcolumn = "80";
      copyindent = true;
      
      ignorecase = true;
      hlsearch = true;
      incsearch = true;
      clipboard = "unnamedplus";
      ttimeoutlen = 100;
      smartcase = true;
      #hidden = true;
      #wildmenu = true;

      foldmethod = "expr";  # syntax, expr
      foldenable = false;
      fileencodings = "utf-8,gbk";
    };
   };
}
