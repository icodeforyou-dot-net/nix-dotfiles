{ config, lib, pkgs, ... }:

{
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470.overrideAttrs (attrs: {
    patches = attrs.patches ++ [ ./patches/nvidia-470xx-fix-linux-6.2.patch ];
  });

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa_drivers
      intel-ocl
      beignet
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  programs.dconf.enable = true;
  programs.light.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    videoDrivers = [ "nvidia" ];
  };

  services.xserver.displayManager.gdm.enable = true;
}
