{ config, lib, pkgs, pkgs-unstable, ... }:

{
  hardware.opentabletdriver.enable = true;

  networking.hostName = "archon";
  system.stateVersion = "21.05";
}
