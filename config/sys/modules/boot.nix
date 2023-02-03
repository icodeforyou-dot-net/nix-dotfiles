{ config, lib, pkgs, ... }:
{
  boot = {
    cleanTmpDir = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    supportedFilesystems = [ "btrfs" "ntfs" ];
  };
}
