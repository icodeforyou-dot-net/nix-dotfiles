{ config, lib, pkgs, ... }:

{

  hardware.opentabletdriver.enable = true;

  networking.hostName = "archon";
  system.stateVersion = "21.05";

}
