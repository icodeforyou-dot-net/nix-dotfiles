{ config, lib, pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
    };

    libvirtd = {
      enable = true;
      extraConfig = ''
        user="ap"
      '';
      # qemu.ovmf = true;
      # Needed for hardware passthrough
      qemu.ovmf.enable = true;
      qemu.runAsRoot = false;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    lxc.lxcfs.enable = true;
    lxd.enable = true;

    virtualbox = {
      guest.enable = false;
      host = {
        enable = true;
        enableHardening = true;
        enableExtensionPack = true;
      };
    };

    waydroid.enable = true;
  };


}