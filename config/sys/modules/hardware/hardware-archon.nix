{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/3ce87e06-d8e9-44cb-803a-cdb3ad756b44";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  boot.initrd.luks.devices."nixenc".device = "/dev/disk/by-uuid/6727260a-68d2-4b85-bad4-fd14012b504d";

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/3ce87e06-d8e9-44cb-803a-cdb3ad756b44";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/3ce87e06-d8e9-44cb-803a-cdb3ad756b44";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/persist" =
    {
      device = "/dev/disk/by-uuid/3ce87e06-d8e9-44cb-803a-cdb3ad756b44";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
    };

  fileSystems."/var/log" =
    {
      device = "/dev/disk/by-uuid/3ce87e06-d8e9-44cb-803a-cdb3ad756b44";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "noatime" ];
    };

  fileSystems."/swap" =
    {
      device = "/dev/disk/by-uuid/3ce87e06-d8e9-44cb-803a-cdb3ad756b44";
      fsType = "btrfs";
      options = [ "subvol=swap" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/E3B3-384B";
      fsType = "vfat";
    };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 65536;
  }];

  # high-resolution display
  # hardware.video.hidpi.enable = lib.mkDefault true;
}
