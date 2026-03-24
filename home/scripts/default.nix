{pkgs, ...}: {
  bluetooth-reconnect = import ./btr.nix {inherit pkgs;};
  mpc-refresh = import ./mpr.nix {inherit pkgs;};
  ytb-bili-download = import ./ybd.nix {inherit pkgs;};
  disk-vault-manager = import ./dvm.nix {inherit pkgs;};
}
