{ config, pkgs, ... }:
let
  wrapped-alacritty = with pkgs; (writeShellScriptBin "alacritty" ''
    if pgrep ".gnome-shell" > /dev/null; then env WAYLAND_DISPLAY= ${pkgs.alacritty}/bin/alacritty; else ${pkgs.alacritty}/bin/alacritty; fi
  '');
in
{
  home.packages = with pkgs; [
    # Wrap alacritty in script
    (symlinkJoin {
      name = "alacritty";
      paths = [
        wrapped-alacritty
        pkgs.alacritty
      ];
    })

    pciutils
    usbutils
    smartmontools
    findutils
    less
    stress
    starship
    glxinfo
    procps

    unstable.gh

    minicom
    picocom

    fzf
    exa
    zoxide
    ripgrep
    universal-ctags
    du-dust
    duf
    tree-sitter
    jq

    # language servers for neovim to be globally accesible
    nodePackages.bash-language-server
    sumneko-lua-language-server

    awscli
    kaggle
    ngrok
    gnumake
    gnused
    gawk
    tokei
    socat
    ranger
    ncdu
    xz
    unstable.youtube-dl
    unrar
    unstable.asciinema
    unstable.moc
    unstable.havoc
    unstable.tiny
    unstable.tealdeer

    bottom
    neofetch

    android-file-transfer
  ];

  # bash
  programs.bash = {
    enable = true;
    profileExtra = ''
      export MOZ_ENABLE_WAYLAND=1
      export MOZ_USE_XINPUT2=1
      export NIXPKGS_ALLOW_UNFREE=1
    '';
    initExtra = ''
      eval "$(direnv hook bash)"
      eval "$(zoxide init bash)"
      eval "$(starship init bash)"

      alias ls='exa -al --color=always --group-directories-first' # my preferred listing
      alias cd='z'

      alias js='cd /home/ap/Coding/javascript'
      alias py='cd /home/ap/Coding/python'
      alias rs='cd /home/ap/Coding/rust'
      alias cpp='cd /home/ap/Coding/cpp'
      alias ans='cd /home/ap/Coding/ansible'
      alias ndf='cd /home/ap/Coding/nix/nix-dotfiles'

      PATH="$PATH:/home/ap/.local/bin/"
    '';
  };

  # bat
  programs.bat = {
    enable = true;
  };

  # direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # foot terminal
  programs.foot = {
    enable = true;
  };

  # lazygit
  programs.lazygit = {
    enable = true;
    settings = { };
  };

  # zellij
  programs.zellij = {
    enable = true;
  };
}
