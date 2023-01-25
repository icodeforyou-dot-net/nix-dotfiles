{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../sys/modules/console/console-desktop.nix
    ../sys/modules/hardware/hardware-archon.nix
    # ../sys/modules/kernels/linuxPackages_latest.nix
    ../sys/modules/kernels/custom-kernels/kernel-5.16.9-source-tree-iteration-4.nix
    ../sys/modules/bluetooth.nix
    ../sys/modules/boot.nix
    ../sys/modules/firejail.nix
    ../sys/modules/fonts.nix
    ../sys/modules/locale.nix
    ../sys/modules/networking-basic.nix
    ../sys/modules/nix.nix
    ../sys/modules/opengl-amd.nix
    ../sys/modules/pipewire.nix
    ../sys/modules/printing.nix
    ../sys/modules/security.nix
    ../sys/modules/system-packages.nix
    ../sys/modules/tablet.nix
    ../sys/modules/users.nix
    ../sys/modules/virtualization.nix
    ../sys/modules/xserver-4k.nix
  ];

  hardware.enableAllFirmware = true;

  networking.hostName = "archon";
  system.stateVersion = "21.05";
}
