{ config, lib, pkgs, ... }:

{

  hardware.enableAllFirmware = true;

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [ hplipWithPlugin ];
    };
  };



  users.users.ap = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "vboxusers" "lxd" "docker" "video" "audio" ];
    initialPassword = "123";
  };




}
