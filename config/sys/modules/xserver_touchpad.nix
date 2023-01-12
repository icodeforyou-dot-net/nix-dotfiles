{ config, lib, pkgs, ... }:
{
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;
}
