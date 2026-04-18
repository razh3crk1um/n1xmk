{
  pkgs,
  dna,
  ...
}: let
  theme_qml_content = import ./theme.nix {inherit dna;};

  quickshell_src = pkgs.runCommand "quickshell-config" {} ''
    mkdir -p $out
    cp -r ${./src}/* $out/
    chmod -R u+w $out
    mkdir -p $out/style
    cat > $out/style/Theme.qml <<EOF
    ${theme_qml_content}
    EOF
  '';
in {
  xdg.configFile."quickshell".source = quickshell_src;
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };
}
