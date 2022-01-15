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
  unstable.ardour

  # Browser
  firefox
  chromium
  brave

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
  gnomeExtensions.appindicator
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
  openssl

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

  #SQL
  unstable.sqlitebrowser
  unstable.dbeaver
  unstable.beekeeper-studio
  # unstable.pgadmin

  # ansible
  ansible
  ansible-lint
  ];




  programs.urxvt = {
  	enable = true;
	fonts = [ "xft:OverpassMono Nerd Font:size=10" ];
	keybindings = {
		"Command-Control-C" = "eval:selection_to_clipboard";
  		"Command-Control-V" = "eval:paste_clipboard";
		};
	extraConfig = {
		internalBorder = 30;
		};
  };

  services.picom = {
	enable = true;
	backend =  "glx";
	extraOptions = 
	  ''
	  '';
  };

  xresources.properties = {
    "Xft.dpi" = 144;
    "Xft.antialias" = true;
    "Xft.autohint" = false;
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintsyle" = "hintful";
    "URxvt.foreground" = "White";
  };

  xresources.extraConfig = ''
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
      vscode-extensions.bbenoist.nix
      vscode-extensions.haskell.haskell
      vscode-extensions.ms-vscode.cpptools
      vscode-extensions.graphql.vscode-graphql
      vscode-extensions.matklad.rust-analyzer ];
    };

 programs.neovim = {
    enable = false;
    vimAlias = true;
    package = pkgs.unstable.neovim;

    plugins = with pkgs.vimPlugins; [
      # Appearance
      indent-blankline-nvim
      barbar-nvim
      nvim-tree-lua
      nvim-web-devicons
      lualine-nvim
      one-nvim
      dracula-vim
      # dashboard-nvim #vimscript

      # Programming
      which-key-nvim
      # vim-haskellConcealPlus # vimscript
      # vim-nix # vimscript
      lspkind-nvim
      nvim-treesitter
      nvim-treesitter-refactor
      nvim-treesitter-textobjects
      nvim-lspconfig
      lspsaga-nvim
      lsp_signature-nvim
      nvim-compe
      vim-vsnip
      vim-vsnip-integ
      rust-tools-nvim
      #vimPlugsFromSource.nvim-lsp-symbols-outline

      # Text objects
      tcomment_vim # vimscript
      vim-surround # vimscript
      nvim-autopairs

      # Git
      gitsigns-nvim

      # DAP
      nvim-dap
      nvim-dap-ui
      #vimPlugsFromSource.nvim-dap-python

      # Fuzzy Finder
      telescope-nvim

      # Text Helpers
      vim-table-mode # vimscript
      todo-comments-nvim

      # General Deps
      popup-nvim
      plenary-nvim
    ];

/*   extraConfig = ''
      # ${builtins.readFile ~/.config/nvim/sane_defaults.vim}
      # ${builtins.readFile ~/.config/nvim/dashboard.vim}

      # colorscheme ${colorscheme.vim-name}


      lua << EOF
        local statusline_theme = '${colorscheme.vim-statusline}'

        local lang_servers_cmd = {
          bashls = {"${pkgs.nodePackages.bash-language-server}/bin/bash-language-server", "start"},
          cssls = {"${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver", "--stdio"},
          cmake = {"${pkgs.cmake-language-server}/bin/cmake-language-server"},
          dockerls = {"${pkgs.nodePackages.dockerfile-language-server-nodejs}/bin/docker-langserver", "--stdio"},
          elmls = {"${pkgs.elmPackages.elm-language-server}/bin/elm-language-server"},
          gopls = {"${pkgs.gopls}/bin/gopls"},
          hls = {"${pkgs.haskellPackages.haskell-language-server}/bin/haskell-language-server", "--lsp"},
          html = {"${pkgs.nodePackages.vscode-html-languageserver-bin}/bin/html-languageserver", "--stdio"},
          jsonls = {"${pkgs.nodePackages.vscode-json-languageserver-bin}/bin/json-languageserver", "--stdio"},
          pyright = {"${pkgs.nodePackages.pyright}/bin/pyright-langserver", "--stdio"},
          rnix = {"${pkgs.rnix-lsp}/bin/rnix-lsp"},
          rust_analyzer = {"${pkgs.rust-analyzer}/bin/rust-analyzer"},
          tsserver = {"${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server", "--stdio"},
          vimls = {"${pkgs.nodePackages.vim-language-server}/bin/vim-language-server", "--stdio"},
          yamlls = {"${pkgs.nodePackages.yaml-language-server}/bin/yaml-language-server", "--stdio"},
          efmls = {"${pkgs.nur.repos.crazazy.efm-langserver}/bin/efm-langserver"},

          prettier = "${pkgs.nodePackages.prettier}/bin/prettier",
          isort = "${pkgs.python3Packages.isort}/bin/isort",
          black = "${pkgs.python3Packages.black}/bin/black",
          lua_format = "${pkgs.luaformatter}/bin/lua-format",
          clippy = "${pkgs.clippy}/bin/cargo-clippy",
          rustfmt = "${pkgs.rustfmt}/bin/cargo-fmt",

          elm = "${pkgs.elmPackages.elm}/bin/elm",
          elm_test = "${pkgs.elmPackages.elm-test}/bin/elm-test",
          elm_format = "${pkgs.elmPackages.elm-format}/bin/elm-format",
        }
  '' */
  };

 programs.alacritty = {
	enable = true;
	settings = {};
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
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
      bindkey -M vicmd 'k' history-beginning-search-backward
      bindkey -M vicmd 'j' history-beginning-search-forward
    '';
  };
}
