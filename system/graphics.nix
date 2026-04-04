{
  lib,
  dna,
  ...
}: let
  gpu_configs = {
    amd = {
    };

    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };

    intel = {
      services.xserver.videoDrivers = ["modesetting"];
    };
  };
in {
  config = lib.mkMerge [
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    }

    # mapping logic
    (gpu_configs."${dna.gpu}" or {})
  ];
}
