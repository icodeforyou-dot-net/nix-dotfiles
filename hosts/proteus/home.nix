{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ap";
  home.homeDirectory = "/home/ap";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  home.packages = with pkgs; [
  # Fonts
  (nerdfonts.override { fonts = [ "Iosevka" "Overpass"]; })

  # GUI Apps
  unstable.mailspring
  slack
  unstable.discord
  element-desktop
  skypeforlinux
  unstable.bitwarden
  unstable.signal-desktop
  unstable.tdesktop
  insomnia
  vlc
  pcmanfm
  lxappearance
  gimp
  darktable
  inkscape
  pdfarranger
  unstable.onlyoffice-bin
  zoom-us
  tutanota-desktop

  # Gaming
  dosbox-staging

  # Browser
  chromium
  brave
  lagrange

  # tor
  unstable.onionshare-gui
  unstable.onionshare
  unstable.tor-browser-bundle-bin

  #
  pciutils
  usbutils
  less
  stress

  openvpn
  gnome3.networkmanager-openvpn
   
  # CLI tools
  awscli
  ngrok
  gnumake
  docker-compose
  tokei
  ranger
  ncdu
  xz
  youtube-dl

  # Shell
  starship
  zsh-syntax-highlighting

  # Searching/Movement helpers
  fzf
  exa
  zoxide
  ripgrep
  universal-ctags
  du-dust
  duf

  # system info
  bottom
  neofetch
  
  # GNOME stuff
  gnome.gnome-tweaks
  gnome.networkmanager-openvpn
  unstable.gnomeExtensions.dash-to-dock
  gnomeExtensions.tweaks-in-system-menu
  gnomeExtensions.gnome-vagrant-indicator
  flat-remix-gtk
  flat-remix-icon-theme
  papirus-icon-theme
  nordic
  tela-icon-theme

  # Android
  android-file-transfer

  # Audio
  pavucontrol

  # Coding

  # general
  git
  github-desktop

  # C
  gcc

  # go
  go

  # Haskell
  ghc
  haskellPackages.cabal-install
  haskellPackages.stack

  # JavaScript
  nodejs
  yarn

  # lua
  lua

  # markdown
  nodePackages.livedown
  pandoc

  # Nix
  dconf2nix

  # python
  (python3.withPackages (ps: with ps; [ setuptools pip debugpy ]))
  poetry
  autoflake
  python3Packages.pip
  python3Packages.ipython
  python3Packages.parso
  python3Packages.twine

  # rust
  rustup

  lldb # debugging setup

  # Containers
  dive
  skopeo

  #SQL
  unstable.sqlitebrowser
  unstable.dbeaver
  unstable.beekeeper-studio
  # unstable.pgadmin

  # ansible
  ansible
  ansible-lint
  sshpass

  # VMs
  quickemu
  vagrant
  ];

  xresources.extraConfig = ''
	URxvt*foreground:  White

	Xft*dpi:                192
	Xft*antialias:          true

	#define nord0 #2E3440
	#define nord1 #3B4252
	#define nord2 #434C5E
	#define nord3 #4C566A
	#define nord4 #D8DEE9
	#define nord5 #E5E9F0
	#define nord6 #ECEFF4
	#define nord7 #8FBCBB
	#define nord8 #88C0D0
	#define nord9 #81A1C1
	#define nord10 #5E81AC
	#define nord11 #BF616A
	#define nord12 #D08770
	#define nord13 #EBCB8B
	#define nord14 #A3BE8C
	#define nord15 #B48EAD

	*.foreground:   nord4
	*.background:   nord0
	*.cursorColor:  nord4
	*fading: 0
	*fadeColor: nord3
	
	*.color0: nord1
	*.color1: nord11
	*.color2: nord14
	*.color3: nord13
	*.color4: nord9
	*.color5: nord15
	*.color6: nord8
	*.color7: nord5
	*.color8: nord3
	*.color9: nord11
	*.color10: nord14
	*.color11: nord13
	*.color12: nord9
	*.color13: nord15
	*.color14: nord7
	*.color15: nord6
  '';

  programs.vscode = {
     enable = true;
     package = pkgs.unstable.vscode;
     extensions = with pkgs; [
      vscode-extensions.pkief.material-icon-theme
      vscode-extensions.bbenoist.nix
      vscode-extensions.haskell.haskell
      vscode-extensions.ms-vscode.cpptools
      vscode-extensions.graphql.vscode-graphql
      vscode-extensions.matklad.rust-analyzer
      vscode-extensions.ms-vscode-remote.remote-ssh ];
    };

  programs.bat = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
    initExtra = ''
    eval "$(direnv hook bash)"
    eval "$(zoxide init bash)"
    eval "$(starship init bash)"

    alias ls='exa -al --color=always --group-directories-first' # my preferred listing

    alias js='cd /home/ap/Coding/javascript'
    alias py='cd /home/ap/Coding/python'
    alias rs='cd /home/ap/Coding/rust'
    alias cpp='cd /home/ap/Coding/cpp'
    alias ans='cd /home/ap/Coding/ansible'
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    defaultKeymap = "viins";
    enableAutosuggestions = true;
    # shellAliases = (import ./zsh/aliases.nix);
    history.extended = true;
    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
          sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
        };
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" ];
    };

    # For this to work with flakes we need to get this into git
    # ${builtins.readFile ./zsh/secrets.zsh}
    # ${builtins.readFile ../../../.secrets/env-vars.sh}
    initExtraBeforeCompInit = ''
      eval "$(direnv hook zsh)"
      bindkey -M vicmd 'k' history-beginning-search-backward
      bindkey -M vicmd 'j' history-beginning-search-forward
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
    '';
  };
}
