{ config, lib, pkgs, ... }:

{
  imports = [ 
  ./hardware-configuration.nix
    ];


  networking.hostName = "archon"; 

  services.xserver.dpi = 144;

}