{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.mpc];

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/media/music";
    dataDir = "${config.xdg.configHome}/mpd";
    extraConfig = ''
      auto_update "yes"
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };
}
