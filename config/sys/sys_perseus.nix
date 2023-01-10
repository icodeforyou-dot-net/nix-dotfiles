{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in

{
  hardware.bluetooth = {
    enable = true;
    # disabledPlugins = [ "sap" ];
    # hsphfpd.enable = true;
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

  hardware.nvidia.prime = {
    offload.enable = true;

    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    intelBusId = "PCI:0:2:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:1:0:0";
  };

  console = {
    earlySetup = true;
    font = "latarcyrheb-sun32";
    keyMap = "us";
  };

  environment.systemPackages = [ nvidia-offload ];

  fonts = {
    enableDefaultFonts = false;

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  powerManagement.powertop.enable = true;

  programs.dconf.enable = true;
  programs.light.enable = true;

  security.rtkit.enable = true;
  security.pam.services.swaylock = { };

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
    videoDrivers = [ "nvidia" ];
  };

  services.xserver.dpi = 96;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;

  system.stateVersion = "22.05";

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
  '';

  # Needed for hardware passthrough
  virtualisation.libvirtd.qemu.ovmf.enable = true;

  virtualisation.virtualbox = {
    guest.enable = false;
    host = {
      enable = true;
      enableHardening = true;
    };
  };
}
