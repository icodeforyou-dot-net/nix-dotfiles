{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    # Creating a wrappter for alacritty to run it in XWayland
    (symlinkJoin {
      paths = [ alacritty ];
      inherit (alacritty) name pname version;
      nativeBuildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/alacritty \
          --set WAYLAND_DISPLAY alacritty
      '';
    })

    pciutils
    usbutils
    less
    stress
    starship
    glxinfo

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

    # language servers for neovim to be globally accesible
    nodePackages.bash-language-server
    sumneko-lua-language-server

    awscli
    kaggle
    ngrok
    gnumake
    tokei
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

    openmw
  ];

  # bash
  programs.bash = {
    enable = true;
    profileExtra = ''
      export env WAYLAND_DISPLAY= alacritty
      export MOZ_ENABLE_WAYLAND=1
      export MOZ_USE_XINPUT2=1
    '';
    initExtra = ''
      eval "$(direnv hook bash)"
      eval "$(zoxide init bash)"
      eval "$(starship init bash)"

      alias ls='exa -al --color=always --group-directories-first' # my preferred listing
      alias cd='z'

      alias js='cd /home/ap/Coding/javascript'
      alias py='cd /home/ap/Coding/python/recent'
      alias rs='cd /home/ap/Coding/rust'
      alias cpp='cd /home/ap/Coding/cpp'
      alias ans='cd /home/ap/Coding/ansible'
      alias ndf='cd /home/ap/Coding/nix-dotfiles'

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
