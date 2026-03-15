{pkgs, ...}: {
  # xserver keyborad layout
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
    options = "caps:escape";
  };
  console.useXkbConfig = true;

  # pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
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

  # hyprlock
  security.pam.services.hyprlock = {};

  # graphics amd
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    #extraPackages = with pkgs; [
    #  mesa
    #  libva
    #  #rocmPackages.clr
    #];
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
