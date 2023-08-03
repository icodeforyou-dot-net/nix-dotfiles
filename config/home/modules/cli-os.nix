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

    # file systems and converters
    fuseiso

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
    unstable.yt-dlp

    unrar
    unstable.asciinema
    unstable.moc
    unstable.havoc
    unstable.tiny
    unstable.tealdeer

    bottom
    neofetch
    xclip

    android-file-transfer

    # Ecnryption, needed for helm secrets
    sops
    age
  ];

  # bash
  programs.bash = {
    enable = true;
    profileExtra = ''
      export MOZ_ENABLE_WAYLAND=1
      export MOZ_USE_XINPUT2=1
      export NIXPKGS_ALLOW_UNFREE=1
      export DBX_CONTAINER_MANAGER="docker"
      export DBX_CONTAINER_HOME_PREFIX="''${HOME}/dbx"
      export KUBECONFIG="''${HOME}/.kube/config"

      export OPENRA_DISPLAY_SCALE=2
    '';
    initExtra = ''
      eval "$(direnv hook bash)"
      eval "$(zoxide init bash)"
      eval "$(starship init bash)"

      alias cb='xclip -selection c'
      alias ls='exa -al --color=always --group-directories-first' # my preferred listing
      alias cd='z'

      alias k='kubectl'
      alias kctx='kubectx'
      alias kns='kubens'

      alias js='cd ''${HOME}/Coding/javascript'
      alias py='cd ''${HOME}/Coding/python'
      alias rs='cd ''${HOME}/Coding/rust'
      alias cpp='cd ''${HOME}/Coding/cpp'
      alias ans='cd ''${HOME}/Coding/ansible'
      alias ndf='cd ''${HOME}/Coding/nix/nix-dotfiles'

      PATH="$PATH:''${HOME}/.local/bin/" 
    '';
  };

  # alacritty config
  home.file.".config/alacritty/alacritty.yml" = {
    executable = false;
    text = ''
      import:
        - ~/.config/alacritty/colorschemes.yml

      window:
        padding:
          x: 15
          y: 15
        
      font:
        normal: 
          family: "JetBrainsMono Nerd Font"
          style: Regular
        bold:
          family: "JetBrainsMono Nerd Font"
          style: Bold
        size: 11
    '';
  };

  # alacritty colorschemes
  home.file.".config/alacritty/colorschemes.yml" = {
    executable = false;
    text = ''
      color_schemes:
        latte: &latte

          # Default colors
          primary:
            background: '#EFF1F5' # base
            foreground: '#4C4F69' # text
            # Bright and dim foreground colors
            dim_foreground: '#4C4F69' # text
            bright_foreground: '#4C4F69' # text

          # Cursor colors
          cursor:
            text: '#EFF1F5' # base
            cursor: '#DC8A78' # rosewater
          vi_mode_cursor:
            text: '#EFF1F5' # base
            cursor: '#7287FD' # lavender

          # Search colors
          search:
            matches:
              foreground: '#EFF1F5' # base
              background: '#6C6F85' # subtext0
            focused_match:
              foreground: '#EFF1F5' # base
              background: '#40A02B' # green
            footer_bar:
              foreground: '#EFF1F5' # base
              background: '#6C6F85' # subtext0

          # Keyboard regex hints
          hints:
            start:
              foreground: '#EFF1F5' # base
              background: '#DF8E1D' # yellow
            end:
              foreground: '#EFF1F5' # base
              background: '#6C6F85' # subtext0

          # Selection colors
          selection:
            text: '#EFF1F5' # base
            background: '#DC8A78' # rosewater

          # Normal colors
          normal:
            black:   '#5C5F77' # subtext1
            red:     '#D20F39' # red
            green:   '#40A02B' # green
            yellow:  '#DF8E1D' # yellow
            blue:    '#1E66F5' # blue
            magenta: '#EA76CB' # pink
            cyan:    '#179299' # teal
            white:   '#ACB0BE' # surface2

          # Bright colors
          bright:
            black:   '#6C6F85' # subtext0
            red:     '#D20F39' # red
            green:   '#40A02B' # green
            yellow:  '#DF8E1D' # yellow
            blue:    '#1E66F5' # blue
            magenta: '#EA76CB' # pink
            cyan:    '#179299' # teal
            white:   '#BCC0CC' # surface1

          # Dim colors
          dim:
            black:   '#5C5F77' # subtext1
            red:     '#D20F39' # red
            green:   '#40A02B' # green
            yellow:  '#DF8E1D' # yellow
            blue:    '#1E66F5' # blue
            magenta: '#EA76CB' # pink
            cyan:    '#179299' # teal
            white:   '#ACB0BE' # surface2

          indexed_colors:
            - { index: 16, color: '#FE640B' }
            - { index: 17, color: '#DC8A78' }



        frappe: &frappe

          # Default colors
          primary:
            background: '#303446' # base
            foreground: '#C6D0F5' # text
            # Bright and dim foreground colors
            dim_foreground: '#C6D0F5' # text
            bright_foreground: '#C6D0F5' # text

          # Cursor colors
          cursor:
            text: '#303446' # base
            cursor: '#F2D5CF' # rosewater
          vi_mode_cursor:
            text: '#303446' # base
            cursor: '#BABBF1' # lavender

          # Search colors
          search:
            matches:
              foreground: '#303446' # base
              background: '#A5ADCE' # subtext0
            focused_match:
              foreground: '#303446' # base
              background: '#A6D189' # green
            footer_bar:
              foreground: '#303446' # base
              background: '#A5ADCE' # subtext0

          # Keyboard regex hints
          hints:
            start:
              foreground: '#303446' # base
              background: '#E5C890' # yellow
            end:
              foreground: '#303446' # base
              background: '#A5ADCE' # subtext0

          # Selection colors
          selection:
            text: '#303446' # base
            background: '#F2D5CF' # rosewater

          # Normal colors
          normal:
            black:   '#51576D' # surface1
            red:     '#E78284' # red
            green:   '#A6D189' # green
            yellow:  '#E5C890' # yellow
            blue:    '#8CAAEE' # blue
            magenta: '#F4B8E4' # pink
            cyan:    '#81C8BE' # teal
            white:   '#B5BFE2' # subtext1

          # Bright colors
          bright:
            black:   '#626880' # surface2
            red:     '#E78284' # red
            green:   '#A6D189' # green
            yellow:  '#E5C890' # yellow
            blue:    '#8CAAEE' # blue
            magenta: '#F4B8E4' # pink
            cyan:    '#81C8BE' # teal
            white:   '#A5ADCE' # subtext0

          # Dim colors
          dim:
            black:   '#51576D' # surface1
            red:     '#E78284' # red
            green:   '#A6D189' # green
            yellow:  '#E5C890' # yellow
            blue:    '#8CAAEE' # blue
            magenta: '#F4B8E4' # pink
            cyan:    '#81C8BE' # teal
            white:   '#B5BFE2' # subtext1

          indexed_colors:
            - { index: 16, color: '#EF9F76' }
            - { index: 17, color: '#F2D5CF' }



        macchiato: &macchiato

          # Default colors
          primary:
            background: '#24273A' # base
            foreground: '#CAD3F5' # text
            # Bright and dim foreground colors
            dim_foreground: '#CAD3F5' # text
            bright_foreground: '#CAD3F5' # text

          # Cursor colors
          cursor:
            text: '#24273A' # base
            cursor: '#F4DBD6' # rosewater
          vi_mode_cursor:
            text: '#24273A' # base
            cursor: '#B7BDF8' # lavender

          # Search colors
          search:
            matches:
              foreground: '#24273A' # base
              background: '#A5ADCB' # subtext0
            focused_match:
              foreground: '#24273A' # base
              background: '#A6DA95' # green
            footer_bar:
              foreground: '#24273A' # base
              background: '#A5ADCB' # subtext0

          # Keyboard regex hints
          hints:
            start:
              foreground: '#24273A' # base
              background: '#EED49F' # yellow
            end:
              foreground: '#24273A' # base
              background: '#A5ADCB' # subtext0

          # Selection colors
          selection:
            text: '#24273A' # base
            background: '#F4DBD6' # rosewater

          # Normal colors
          normal:
            black:   '#494D64' # surface1
            red:     '#ED8796' # red
            green:   '#A6DA95' # green
            yellow:  '#EED49F' # yellow
            blue:    '#8AADF4' # blue
            magenta: '#F5BDE6' # pink
            cyan:    '#8BD5CA' # teal
            white:   '#B8C0E0' # subtext1

          # Bright colors
          bright:
            black:   '#5B6078' # surface2
            red:     '#ED8796' # red
            green:   '#A6DA95' # green
            yellow:  '#EED49F' # yellow
            blue:    '#8AADF4' # blue
            magenta: '#F5BDE6' # pink
            cyan:    '#8BD5CA' # teal
            white:   '#A5ADCB' # subtext0

          # Dim colors
          dim:
            black:   '#494D64' # surface1
            red:     '#ED8796' # red
            green:   '#A6DA95' # green
            yellow:  '#EED49F' # yellow
            blue:    '#8AADF4' # blue
            magenta: '#F5BDE6' # pink
            cyan:    '#8BD5CA' # teal
            white:   '#B8C0E0' # subtext1

          indexed_colors:
            - { index: 16, color: '#F5A97F' }
            - { index: 17, color: '#F4DBD6' }



        mocha: &mocha

          # Default colors
          primary:
            background: '#1E1E2E' # base
            foreground: '#CDD6F4' # text
            # Bright and dim foreground colors
            dim_foreground: '#CDD6F4' # text
            bright_foreground: '#CDD6F4' # text

          # Cursor colors
          cursor:
            text: '#1E1E2E' # base
            cursor: '#F5E0DC' # rosewater
          vi_mode_cursor:
            text: '#1E1E2E' # base
            cursor: '#B4BEFE' # lavender

          # Search colors
          search:
            matches:
              foreground: '#1E1E2E' # base
              background: '#A6ADC8' # subtext0
            focused_match:
              foreground: '#1E1E2E' # base
              background: '#A6E3A1' # green
            footer_bar:
              foreground: '#1E1E2E' # base
              background: '#A6ADC8' # subtext0

          # Keyboard regex hints
          hints:
            start:
              foreground: '#1E1E2E' # base
              background: '#F9E2AF' # yellow
            end:
              foreground: '#1E1E2E' # base
              background: '#A6ADC8' # subtext0

          # Selection colors
          selection:
            text: '#1E1E2E' # base
            background: '#F5E0DC' # rosewater

          # Normal colors
          normal:
            black:   '#45475A' # surface1
            red:     '#F38BA8' # red
            green:   '#A6E3A1' # green
            yellow:  '#F9E2AF' # yellow
            blue:    '#89B4FA' # blue
            magenta: '#F5C2E7' # pink
            cyan:    '#94E2D5' # teal
            white:   '#BAC2DE' # subtext1

          # Bright colors
          bright:
            black:   '#585B70' # surface2
            red:     '#F38BA8' # red
            green:   '#A6E3A1' # green
            yellow:  '#F9E2AF' # yellow
            blue:    '#89B4FA' # blue
            magenta: '#F5C2E7' # pink
            cyan:    '#94E2D5' # teal
            white:   '#A6ADC8' # subtext0

          # Dim colors
          dim:
            black:   '#45475A' # surface1
            red:     '#F38BA8' # red
            green:   '#A6E3A1' # green
            yellow:  '#F9E2AF' # yellow
            blue:    '#89B4FA' # blue
            magenta: '#F5C2E7' # pink
            cyan:    '#94E2D5' # teal
            white:   '#BAC2DE' # subtext1

          indexed_colors:
            - { index: 16, color: '#FAB387' }
            - { index: 17, color: '#F5E0DC' }



      colors: *mocha
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
      alpha=1
      foreground=d9e0ee
      background=1E1E2E
      # background=11111b

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

      [csd]
      preferred=server
      size=0
      # font=<primary font>
      # color=abe9b3
      # hide-when-typing=no
      border-width=1
      # border-color=abe9b3
      button-width=0
      # button-color=<background color>
      # button-minimize-color=<regular4>
      # button-maximize-color=<regular2>
      # button-close-color=<regular1>
    '';
  };

  # lazygit
  programs.lazygit = {
    enable = true;
    settings = { };
  };

  # tmux
  programs.tmux = {
    enable = true;
  };

  # zellij
  programs.zellij = {
    enable = true;
  };
}
