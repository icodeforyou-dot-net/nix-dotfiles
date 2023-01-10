{ config, lib, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa_drivers
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };
}
