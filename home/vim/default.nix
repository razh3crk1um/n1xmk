{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./vim.nix
    ./keys.nix
    ./plugins.nix
    ./lsp.nix
  ];
}
