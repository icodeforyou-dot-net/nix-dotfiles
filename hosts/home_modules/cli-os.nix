{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  unstable.alacritty
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
  ];

  programs.bash = {
    enable = true;
    initExtra = ''
    eval "$(direnv hook bash)"
    eval "$(zoxide init bash)"
    eval "$(starship init bash)"

    alias ls='exa -al --color=always --group-directories-first' # my preferred listing

    alias js='cd /home/ap/Coding/javascript'
    alias py='cd /home/ap/Coding/python/recent'
    alias rs='cd /home/ap/Coding/rust'
    alias cpp='cd /home/ap/Coding/cpp'
    alias ans='cd /home/ap/Coding/ansible'
    alias ndf='cd /home/ap/Coding/nix-dotfiles'
    '';
  };

  programs.bat = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.lazygit = {
      enable = true;
      settings = {    
      };
    };

  # programs.zellij = {
  #     enable = true;
  #     settings = {
  #       theme = "nord";
  #       themes.nord = {
  #         fg = "[216, 222, 233] #D8DEE9";
  #         bg = "[46, 52, 64] #2E3440";
  #         black = "[59, 66, 82] #3B4252";
  #         red = "[191, 97, 106] #BF616A";
  #         green = "[163, 190, 140] #A3BE8C";
  #         yellow = "[235,203,139] #EBCB8B";
  #         blue = "[129, 161, 193] #81A1C1";
  #         magenta = "[180, 142, 173] #B48EAD";
  #         cyan = "[136, 192, 208] #88C0D0";
  #         white = "[229, 233, 240] #E5E9F0";
  #         orange = "[208, 135, 112] #D08770";
  #       };
  #     };
  # };

}