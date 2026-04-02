{pkgs, ...}: {
  # xserver keyborad layout
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
    options = "caps:swapescape";
  };
  console.useXkbConfig = true;

  # xdg portal
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "gtk";
  };

  # dubs
  services.dbus.enable = true;
  programs.dconf.enable = true;

  # envfs
  services.envfs.enable = true;

  # hm
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  # pam
  security.pam.services.swaylock = {};

  # pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # battery
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # ssd
  services = {
    fstrim.enable = true;
    smartd = {
      enable = true;
      autodetect = true;
      notifications.wall.enable = true;
    };
  };

  # input method
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
    ];
  };
}
