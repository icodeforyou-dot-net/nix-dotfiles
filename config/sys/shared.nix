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

  sound.enable = true;

  users.users.ap = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "vboxusers" "lxd" "docker" "video" "audio" ];
    initialPassword = "123";
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    pstree
    lm_sensors
    killall
    unzip
    lsof
    gocryptfs
    virtmanager
    gptfdisk
    acpi
    virglrenderer
  ];

  security.sudo.execWheelOnly = true;


}
