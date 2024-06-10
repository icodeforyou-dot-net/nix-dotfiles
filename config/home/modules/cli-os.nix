{ pkgs, ... }: {
  home.packages = with pkgs; [
    pciutils
    usbutils
    smartmontools
    findutils
    less
    starship
    glxinfo
    procps

    unstable.gh

    fzf
    # Use eza as a dropin replacement for exa
    unstable.eza
    zoxide
    ripgrep
    universal-ctags
    du-dust
    duf
    tree-sitter
    jq
    yq

    # language servers for neovim to be globally accesible
    nodePackages.bash-language-server
    sumneko-lua-language-server

    # file systems and converters
    fuseiso

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

    # amdgpu monitoring
    unstable.amdgpu_top

    android-file-transfer
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
      alias ls='eza -al --color=always --group-directories-first'
      alias cd='z'
      alias lg='lazygit'

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
      dpi-aware=yes

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
    plugins = [
    ];
  };

  #tmux conf
  home.file.".tmux.conf" = {
    executable = false;
    text = ''
      # source-file ~/.config/tmux/tmux.reset.conf
      set-option -g default-terminal 'screen-254color'
      set-option -g terminal-overrides ',xterm-256color:RGB'

      set -g prefix ^A
      set -g base-index 0
      set -g detach-on-destroy off     # don't exit from tmux when closing a session
      set -g escape-time 0             # zero-out escape time delay
      set -g history-limit 2000
      set -g renumber-windows on       # renumber all windows when any window is closed
      set -g set-clipboard on          # use system clipboard
      set -g status-position top       # macOS / darwin style
      set -g default-terminal foot
      setw -g mode-keys vi
      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'

      set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
      set -g @fzf-url-history-limit '2000'

      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'tmux-plugins/tmux-yank'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      set -g @plugin 'fcsonline/tmux-thumbs'
      set -g @plugin 'sainnhe/tmux-fzf'
      set -g @plugin 'wfxr/tmux-fzf-url'
      set -g @plugin 'catppuccin/tmux'

      set -g @sessionx-bind 'o'
      set -g @sessionx-x-path '~/dotfiles'
      set -g @sessionx-window-height '85%'
      set -g @sessionx-window-width '75%'
      set -g @sessionx-zoxide-mode 'on'
      set -g @sessionx-filter-current 'false'
      set -g @sessionx-preview-enabled 'true'
      set -g @continuum-restore 'on'
      set -g @resurrect-strategy-nvim 'session'
      set -g @catppuccin_window_left_separator ""
      set -g @catppuccin_window_right_separator " "
      set -g @catppuccin_window_middle_separator " █"
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_window_default_text "#W"
      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
      set -g @catppuccin_status_modules_right "directory meetings date_time"
      set -g @catppuccin_status_modules_left "session"
      set -g @catppuccin_status_left_separator  " "
      set -g @catppuccin_status_right_separator " "
      set -g @catppuccin_status_right_separator_inverse "no"
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_directory_text "#{b:pane_current_path}"
      # set -g @catppuccin_meetings_text "#($HOME/.config/tmux/scripts/cal.sh)"
      set -g @catppuccin_date_time_text "%H:%M"

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };

  # zellij
  programs.zellij = {
    enable = true;
  };
}
