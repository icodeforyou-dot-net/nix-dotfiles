# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.blacklistedKernelModules = [ "b43" "bcma" ];
  boot.kernelModules = [
    "facetimehd"
    "kvm-intel"
    "wl"
   ];
  boot.extraModulePackages = [ 
    config.boot.kernelPackages.facetimehd
    config.boot.kernelPackages.broadcom_sta
  ];
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/af19011c-9b51-4ada-9658-5cb91a1ddfd0";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  boot.initrd.luks.devices."nixenc".device = "/dev/disk/by-uuid/9d426526-1aa5-44f8-98ad-889f8c848bee";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/af19011c-9b51-4ada-9658-5cb91a1ddfd0";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/af19011c-9b51-4ada-9658-5cb91a1ddfd0";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/af19011c-9b51-4ada-9658-5cb91a1ddfd0";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/af19011c-9b51-4ada-9658-5cb91a1ddfd0";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "noatime" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/af19011c-9b51-4ada-9658-5cb91a1ddfd0";
      fsType = "btrfs";
      options = [ "subvol=swap" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3862-4E83";
      fsType = "vfat";
    };

  swapDevices = [{
     device = "/swap/swapfile";
     size = 8192;
}];

  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
