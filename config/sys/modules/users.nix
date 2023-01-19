{ config, lib, pkgs, ... }:

{
  users.users.ap = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "vboxusers" "lxd" "docker" "video" "audio" ];
    initialPassword = "123";
  };
}
