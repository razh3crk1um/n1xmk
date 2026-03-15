{
  pkgs,
  ...
}:
{
  home.file.".local/share/v2rayN/bin/xray/xray".source = "${pkgs.xray}/bin/xray";
  home.file.".local/share/v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
  home.file.".local/share/v2rayN/bin/geoip.dat".source = "${pkgs.v2ray-geoip}/share/v2ray/geoip.dat";
  home.file.".local/share/v2rayN/bin/geosite.dat".source = "${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat";
}
