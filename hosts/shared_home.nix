{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "ap";
  home.homeDirectory = "/home/ap";
  home.stateVersion = "21.11";

  home.file = {
    # Configuration for helix editor
      ".config/helix/config.toml" = {
        executable = false;
        text = ''
        theme = "nord"

        [editor]
        line-number = "absolute"
        mouse = true
        scrolloff = 2

        [editor.file-picker]
        hidden = false

        [keys.normal]
        g = { a = "code_action" } # Maps `ga` to show possible code actions
        C-c = "no_op"
        "C-/" = "toggle_comments"

        [keys.insert]
        j = { k = "normal_mode" } # Maps `jk` to exit insert mode
        C-c = "normal_mode"
        
        [keys.select]
        '';
      };

    # Configuration for doxbox-staging
      ".config/dosbox/dosbox-staging.conf" = {
          executable = false;
          text = "
          # This is the configuration file for dosbox-staging (0.77.1).
          [sdl]
          fullscreen       = false
          display          = 0
          fullresolution   = desktop
          windowresolution = default
          output           = opengl
          texture_renderer = auto
          capture_mouse    = seamless middlerelease
          sensitivity      = 100
          raw_mouse_input  = false
          waitonerror      = true
          priority         = auto,auto
          mapperfile       = mapper-sdl2-0.77.1.map
          screensaver      = auto

          [dosbox]    
          language          = 
          machine           = svga_s3
          captures          = capture
          memsize           = 16
          startup_verbosity = high

          [render]
          frameskip          = 0
          aspect             = true
          monochrome_palette = white
          scaler             = none
          glshader           = default

          [cpu]
          core      = auto
          cputype   = auto
          cycles    = auto
          cycleup   = 10
          cycledown = 20

          [mixer]
          nosound   = false
          rate      = 44100
          blocksize = 1024
          prebuffer = 25

          [midi]
          mididevice = auto
          midiconfig = 
          mpu401     = intelligent

          [fluidsynth]
          soundfont = default.sf2

          [mt32]
          model  = auto
          romdir = 

          [sblaster]
          sbtype  = sb16
          sbbase  = 220
          irq     = 7
          dma     = 1
          hdma    = 5
          sbmixer = true
          oplmode = auto
          oplemu  = default

          [gus]
          gus      = false
          gusbase  = 240
          gusirq   = 5
          gusdma   = 3
          ultradir = C:\ULTRASND

          [innovation]
          sidmodel   = none
          sidclock   = default
          sidport    = 280
          6581filter = 50
          8580filter = 50

          [speaker]
          pcspeaker   = true
          pcrate      = 18939
          zero_offset = auto
          tandy       = auto
          tandyrate   = 44100
          disney      = true
          ps1audio    = false

          [joystick]
          joysticktype  = auto
          timed         = true
          autofire      = false
          swap34        = false
          buttonwrap    = false
          circularinput = false
          deadzone      = 10

          [serial]
          serial1       = dummy
          serial2       = dummy
          serial3       = disabled
          serial4       = disabled
          phonebookfile = phonebook.txt

          [dos]
          xms            = true
          ems            = true
          umb            = true
          ver            = 5.0
          keyboardlayout = auto

          [ipx]
          ipx = false

          [autoexec]
          # Lines in this section will be run at startup.
          # You can put your MOUNT lines here.
          mount c ~/Games/dos
          ";
      };
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
      vscode-extensions.pkief.material-icon-theme
      vscode-extensions.arcticicestudio.nord-visual-studio-code
      vscode-extensions.bbenoist.nix
      vscode-extensions.haskell.haskell
      vscode-extensions.ms-vscode.cpptools
      vscode-extensions.graphql.vscode-graphql
      vscode-extensions.ms-python.python
      vscode-extensions.ms-python.vscode-pylance
      vscode-extensions.ms-toolsai.jupyter
      vscode-extensions.ms-azuretools.vscode-docker
      vscode-extensions.matklad.rust-analyzer
      vscode-extensions.ms-vscode-remote.remote-ssh
      vscode-extensions.redhat.vscode-yaml
      vscode-extensions.svelte.svelte-vscode ];
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
    alias py='cd /home/ap/Coding/python/recent'
    alias rs='cd /home/ap/Coding/rust'
    alias cpp='cd /home/ap/Coding/cpp'
    alias ans='cd /home/ap/Coding/ansible'
    alias ndf='cd /home/ap/Coding/nix-dotfiles'
    '';
  };
  
  programs.lazygit = {
      enable = true;
      settings = {    
      };
    };
  
  programs.go = {
      enable = true;
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

  # xdg.userDirs = {
  #       enable = true;
  #       documents = "$HOME/misc/";
  #       download = "$HOME/Downloads/";
  #       videos = "$HOME/misc/";
  #       music = "$HOME/misc/";
  #       pictures = "$HOME/Pictures/";
  #       desktop = "$HOME/misc/";
  #       publicShare = "$HOME/misc/";
  #       templates = "$HOME/misc/";
  #   };
}