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

  # foot terminal config + catppuccin mocha colors
  home.file.".config/foot/foot.ini" = {
    executable = false;
    text = ''    
      initial-window-size-chars=82x23
      initial-window-mode=windowed
      pad=15x15
      resize-delay-ms=100

      font=JetBrainsMono Nerd Font:size=8
      #font-bold=JetBrainsMono Nerd Font:size=8
      #font-italic=JetBrainsMono Nerd Font:size=8
      #font-bold-italic=JetBrainsMono Nerd Font:size=8
      #line-height=10
      #letter-spacing=0
      #horizontal-letter-offset=0
      #vertical-letter-offset=0
      #underline-offset=0
      #box-drawings-uses-font-glyphs=no
      dpi-aware=auto

      [scrollback]
      lines=1000
      multiplier=3.0

      [cursor]
      style=block
      blink=yes

      [mouse]
      hide-when-typing=yes
      alternate-scroll-mode=yes

      [colors]
      alpha=0.9
      foreground=d9e0ee
      background=11111b

      ## Normal/regular colors (color palette 0-7)
      regular0=6e6c7e  # black
      regular1=f28fad  # red
      regular2=abe9b3  # green
      regular3=fae3b0  # yellow
      regular4=96cdfb  # blue
      regular5=f5c2e7  # magenta
      regular6=89dceb  # cyan
      regular7=d9e0ee  # white

      ## Bright colors (color palette 8-15)
      bright0=988ba2   # bright black
      bright1=f28fad   # bright red
      bright2=abe9b3   # bright green
      bright3=fae3b0   # bright yellow
      bright4=96cdfb   # bright blue
      bright5=f5c2e7   # bright magenta
      bright6=89dceb   # bright cyan
      bright7=d9e0ee   # bright white
    '';
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
