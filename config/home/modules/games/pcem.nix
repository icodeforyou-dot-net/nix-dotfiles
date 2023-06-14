{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pcem
    _86Box
  ];
}
