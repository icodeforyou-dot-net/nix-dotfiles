{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{
  hardware.enableAllFirmware = true;

  networking.hostName = "cadmus";
  system.stateVersion = "22.05";
}
