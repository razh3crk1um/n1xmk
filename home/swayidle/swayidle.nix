{
  pkgs,
  dna,
  ...
}: let
  c = dna.colors;
  lockcore = "pgrep swaylock || ${pkgs.swaylock-effects}/bin/swaylock -f --indicator --clock -S --ring-color=${c.black} --key-hl-color=${c.red} --text-color=${c.red} --inside-clear-color=${c.yellow} --ring-clear-color=${c.yellow} --inside-ver-color=${c.blue} --ring-ver-color=${c.blue} --effect-blur 7x5";
  locksession = "loginctl lock-session";
in {
  home.packages = [pkgs.swaylock-effects];

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 720;
        command = "${pkgs.systemd}/bin/loginctl lock-session $XDG_SESSION_ID";
      }
      {
        timeout = 900;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
        resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }
      {
        timeout = 1800;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = {
      "lock" = lockcore;
      "before-sleep" = locksession;
    };
  };
}
