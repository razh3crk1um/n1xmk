{
  config,
  dna,
  ...
}: {
  home.file.".mozilla/native-messaging-hosts".enable = false;
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";

    profiles."${dna.user}" = {
      id = 0;
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "media.peerconnection.enabled" = false;
        "network.dns.disableIPv6" = true;
      };

      userChrome = ''
        #appmenu-button, #tabbrowser-tabs,.tabbrowser-tab, .tabs-newtab-button {
          height:10px !important; display: none !important;
        }

        #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
          visibility: collapse !important;
        }
      '';
    };
  };
}
