{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix = {
        package = pkgs.nixUnstable;
        extraOptions = ''
        experimental-features = nix-command flakes
        '';
  };

  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "btrfs" ];
  boot.loader.systemd-boot = {
    enable = true;
    consoleMode = "auto";
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.cleanTmpDir = true;


  networking.hostName = "proteus"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;

  users.users.ap = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "vboxusers" "libvirtd" "lxd" ]; # Enable ‘sudo’ for the user.
    initialPassword = "123";
  };

  environment.systemPackages = with pkgs; [
     vim
     wget
     pstree
     lm_sensors
     killall
     unzip
     lsof
     glibc
     wirelesstools
     openvpn
     gocryptfs
     virtmanager
  ];

  security.sudo.execWheelOnly = true;

  programs.dconf.enable = true;

  programs.firejail = {
        enable = true;
        wrappedBinaries = {
                firefox = {
                        executable = "${lib.getBin pkgs.firefox}/bin/firefox";
                        profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
                };
                discord = {
                        executable = "${lib.getBin pkgs.firefox}/bin/discord";    
                        profile = "${pkgs.firejail}/etc/firejail/discord.profile";
                };                                                                                                                                        };
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  virtualisation.virtualbox.host = {
    enable = true;
    enableHardening = true;
    enableExtensionPack = true;
  };

  virtualisation.virtualbox.guest.enable = false;

  virtualisation.libvirtd = {
    enable = true;
    # qemuOvmf = true;
    qemu.runAsRoot = false;
    onBoot = "ignore";
    onShutdown = "shutdown";
  };

  virtualisation.lxd.enable = true;
  virtualisation.lxc.lxcfs.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

