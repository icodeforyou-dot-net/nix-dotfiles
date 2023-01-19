{ config, lib, pkgs, pkgs-unstable, ... }:
{
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
  '';
}
