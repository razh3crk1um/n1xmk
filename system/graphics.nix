{
  lib,
  pkgs,
  dna,
  ...
}: {
  config = lib.mkMerge [
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    }

    # amd
    (lib.mkIf (dna.gpu == "amd") {
      hardware.graphics.extraPackages = with pkgs; [
        amdvlk
      ];
    })

    # nvidia
    (lib.mkIf (dna.gpu == "nvidia") {
      services.xserver.videoDrivers = ["nvidia"];

      hardware.nvidia = {
        open = true;
        modesetting.enable = true;

        powerManagement.enable = false;
        powerManagement.finegrained = false;

        # stable*, beta, production
        #package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    })
  ];
}
