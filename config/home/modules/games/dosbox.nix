{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dosbox-staging
  ];

  # Configuration for doxbox-staging
  home.file.".config/dosbox/dosbox-staging.conf" = {
    executable = false;
    text = "
      # This is the configuration file for dosbox-staging (0.78.1).
      # Lines starting with a '#' character are comments.

      [sdl]
      fullscreen         = false
      display            = 0
      fullresolution     = desktop
      windowresolution   = default
      window_position    = auto
      window_decorations = true
      vsync              = false
      vsync_skip         = 7000
      max_resolution     = auto
      output             = opengl
      texture_renderer   = auto
      capture_mouse      = seamless middlerelease
      sensitivity        = 100
      raw_mouse_input    = false
      waitonerror        = true
      priority           = auto,auto
      mapperfile         = mapper-sdl2-0.78.1.map
      screensaver        = auto

      [dosbox]
      language          = en
      machine           = svga_s3
      captures          = capture
      memsize           = 16
      vmemsize          = auto
      vesa_modes        = compatible
      speed_mods        = true
      autoexec_section  = join
      startup_verbosity = auto

      [render]
      #             scaler: Scaler used to enlarge/enhance low resolution modes.
      #                     If 'forced' is appended, then the scaler will be used even if
      #                     the result might not be desired.
      #                     Note that some scalers may use black borders to fit the image
      #                     within your configured display resolution. If this is
      #                     undesirable, try either a different scaler or enabling
      #                     fullresolution output.
      #                     Possible values: none, normal2x, normal3x, advmame2x, advmame3x, advinterp2x, advinterp3x, hq2x, hq3x, 2xsai, super2xsai, supereagle, tv2x, tv3x, rgb2x, rgb3x, scan2x, scan3x.
      #           glshader: Either 'none' or a GLSL shader name. Works only with
      #                     OpenGL output.  Can be either an absolute path, a file
      #                     in the 'glshaders' subdirectory of the DOSBox
      #                     configuration directory, or one of the built-in shaders:
      #                     advinterp2x, advinterp3x, advmame2x, advmame3x,
      #                     crt-easymode-flat, crt-fakelottes-flat, rgb2x, rgb3x,
      #                     scan2x, scan3x, tv2x, tv3x, sharp (default).

      frameskip          = 0
      aspect             = true
      monochrome_palette = white
      scaler             = none
      glshader           = none

      [composite]
      composite   = auto
      era         = auto
      hue         = 0
      saturation  = 100
      contrast    = 100
      brightness  = 0
      convergence = 0

      [cpu]
      core      = auto
      cputype   = pentium_slow
      cycles    = max limit 75000
      cycleup   = 10
      cycledown = 20

      [mixer]
      nosound   = false
      rate      = 48000
      blocksize = 512
      prebuffer = 20
      negotiate = true

      [midi]
      mididevice = auto
      midiconfig =
      mpu401     = intelligent

      [fluidsynth]
      soundfont = default.sf2
      chorus    = auto
      reverb    = auto

      [mt32]
      model  = auto
      romdir =

      [sblaster]
      sbtype   = sb16
      sbbase   = 220
      irq      = 7
      dma      = 1
      hdma     = 5
      sbmixer  = true
      sbwarmup = 100
      oplmode  = auto
      oplemu   = default

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

      [ethernet]
      ne2000            = false
      nicbase           = 300
      nicirq            = 3
      macaddr           = AC:DE:48:88:99:AA
      tcp_port_forwards =
      udp_port_forwards =

      [autoexec]
    ";
  };
}
