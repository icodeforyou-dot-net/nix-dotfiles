{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dosbox-staging
  ];

  # Configuration for doxbox-staging
  home.file.".config/dosbox/dosbox-staging.conf" = {
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
}
