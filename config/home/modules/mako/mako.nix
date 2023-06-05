{ config, pkgs, ... }:

{

  # mako notifications
  services.mako = {
    enable = true;
    package = pkgs.unstable.mako;
    iconPath = "~/Coding/nix/nix-dotfiles/hosts/perseus/modules/mako/icons";
    actions = true;
    anchor = "top-right";
    backgroundColor = "#1e1e2e";
    borderColor = "#313244";
    borderRadius = 5;
    borderSize = 2;
    defaultTimeout = 5000;
    font = "JetBrains Mono 10";
    format = null;
    groupBy = "category";
    height = 100;
    icons = true;
    ignoreTimeout = false;
    layer = "overlay";
    margin = "10";
    markup = true;
    maxIconSize = 48;
    maxVisible = 5;
    output = null;
    padding = "15";
    progressColor = "over #89b4fa";
    sort = "-time";
    textColor = "#d9e0ee";
    width = 300;
    extraConfig = ''
      # GLOBAL CONFIGURATION OPTIONS
      max-history=100

      # BINDING OPTIONS
      on-button-left=dismiss
      on-button-middle=none
      on-button-right=dismiss-all
      on-touch=dismiss
      on-notify=exec mpv /usr/share/sounds/freedesktop/stereo/message.oga

      # STYLE OPTIONS
      icon-location=left
      history=1
      text-alignment=left

      [urgency=low]
      border-color=#313244
      default-timeout=2000

      [urgency=normal]
      border-color=#313244
      default-timeout=5000

      [urgency=high]
      border-color=#f38ba8
      text-color=#f38ba8
      default-timeout=0

      [category=mpd]
      border-color=#f9e2af
      default-timeout=2000
    '';
  };
}
