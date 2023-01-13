{ config, lib, pkgs, pkgs-unstable, ... }:
{
  security.rtkit.enable = true;
  security.pam.services.swaylock = { };
  security.sudo.execWheelOnly = true;
}
