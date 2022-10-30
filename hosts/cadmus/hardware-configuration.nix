{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/1c7cc345-3829-4e88-bd68-47306c7efcef";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  boot.initrd.luks.devices."nixenc".device = "/dev/disk/by-uuid/272cbce9-e471-4116-a5c3-6538d92e532e";

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/1c7cc345-3829-4e88-bd68-47306c7efcef";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/1c7cc345-3829-4e88-bd68-47306c7efcef";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/var/log" =
    {
      device = "/dev/disk/by-uuid/1c7cc345-3829-4e88-bd68-47306c7efcef";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "noatime" ];
    };


  fileSystems."/swap" =
    {
      device = "/dev/disk/by-uuid/1c7cc345-3829-4e88-bd68-47306c7efcef";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };


  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/C4FD-1C4E";
      fsType = "vfat";
    };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 16384;
  }];

  networking.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
