{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;

  hardware.bluetooth = {
    enable = true;
    disabledPlugins = [ "sap" ];
    hsphfpd.enable = true;
    package = pkgs.bluezFull;
    powerOnBoot = false;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa_drivers
      intel-ocl
      beignet
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware.pulseaudio.enable = false;

  console = {
    earlySetup = true;
    font = "latarcyrheb-sun32";
    keyMap = "us";
  };

  fonts = {
    enableDefaultFonts = false;

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # networking.wireless.iwd.enable = false;

  powerManagement.powertop.enable = true;

  programs.dconf.enable = true;
  programs.light.enable = true;

  security.rtkit.enable = true;

  services.power-profiles-daemon.enable = false;

  services.blueman.enable = true;

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

  services.tlp = {
    enable = true;
    settings = {
      PCIE_ASPM_ON_BAT = "powersupersave";
      DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
    };
  };

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
  };

  services.xserver.dpi = 144;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;

  system.stateVersion = "22.05";

  virtualisation.virtualbox = {
    guest.enable = false;
    host = {
      enable = true;
      enableHardening = true;
    };
  };
}
