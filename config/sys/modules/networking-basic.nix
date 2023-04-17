{ config, lib, pkgs, pkgs-unstable, ... }:
{
  networking = {
    firewall.enable = true;
    hosts = {
      "192.168.200.100" = [ "minikube.local" ];
    };
    networkmanager.enable = true;
  };
}
