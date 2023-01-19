{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{
  hardware.enableAllFirmware = true;

  networking.hostName = "perseus";
  system.stateVersion = "22.05";
}
