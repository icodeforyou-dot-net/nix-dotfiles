{ pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      # mesa_drivers
      rocm-opencl-icd
      rocm-opencl-runtime
      rocmPackages.rocm-runtime
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  programs.dconf.enable = true;
  programs.light.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    xkb.layout = "us";
    videoDrivers = [ "amdgpu" ];
  };

  services.xserver.displayManager.gdm.enable = true;
}
