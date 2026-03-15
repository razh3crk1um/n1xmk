{pkgs, ...}: {
  bt-reconnect = import ./btr.nix {inherit pkgs;};
  mp-refresh = import ./mpr.nix {inherit pkgs;};
  yb-download = import ./ybd.nix {inherit pkgs;};
}
