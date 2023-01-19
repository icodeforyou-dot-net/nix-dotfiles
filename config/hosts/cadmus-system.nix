{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{
  networking.hostName = "cadmus";
  system.stateVersion = "22.05";
}
