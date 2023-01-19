{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{
  networking.hostName = "perseus";
  system.stateVersion = "22.05";
}
