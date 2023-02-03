{ config, lib, pkgs, pkgs-unstable, ... }:
{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [ hplipWithPlugin ];
    };
  };
}
