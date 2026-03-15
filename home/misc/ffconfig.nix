{
  pkgs,
  ...
}:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif      = [ "Sarasa Mono CL" ];
      sansSerif  = [ "Sarasa Mono CL" ];
      monospace  = [ "Sarasa Mono CL" ];
    };
  };
}
