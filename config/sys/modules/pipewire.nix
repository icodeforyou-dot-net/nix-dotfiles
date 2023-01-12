{ config, lib, pkgs, pkgs-unstable, ... }:

{
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      package = pkgs.unstable.wireplumber;
    };
  };
}
