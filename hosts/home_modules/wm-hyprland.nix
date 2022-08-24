{ config, pkgs, ... }:

{

  { config, pkgs, ... }:

  {
  home.packages = with pkgs; [
    unstable.hyprland

    wofi
    waybar
    swaybg
    swayidle
    swaylock
    mako
    lf
    slurp
    grim
    wf-recorder
    light
    yad
    viewnior
    wl-clipboard
    xfce.thunar
  ];
}
# home.file = {
#   # foot config
#   ".config/foot/foot.ini" = {
#       executable = false;
#       text = import .config/foot/foot.ini;
#       };
#   # wofi config
#   ".config/wofi/config" = {
#       executable = false;
#       text = import .config/wofi/config;
#       };
#   ".config/wofi/style.css" = {
#       executable = false;
#       text = import .config/wofi/style.css
#       };
# };
}
