{ config, lib, pkgs, ... }:

{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  boot = {
    cleanTmpDir = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    supportedFilesystems = [ "btrfs" ];
  };

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    # Replacement for Times New Roman, Arial
    liberation_ttf
    google-fonts
  ];

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [ hplipWithPlugin ];
    };
  };

  sound.enable = true;

  users.users.ap = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "vboxusers" "lxd" "docker" ];
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
    gocryptfs
    virtmanager
    gptfdisk
  ];

  security.sudo.execWheelOnly = true;

  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      firefox = {
        executable = "${lib.getBin pkgs.firefox}/bin/firefox";
        profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
      };
      discord = {
        executable = "${lib.getBin pkgs.discord}/bin/discord";
        profile = "${pkgs.firejail}/etc/firejail/discord.profile";
      };
    };
  };

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
    };

    libvirtd = {
      enable = true;
      # qemuOvmf = true;
      qemu.runAsRoot = false;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    lxc.lxcfs.enable = true;
    lxd.enable = true;

    waydroid.enable = true;
  };

}
