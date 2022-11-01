# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {

    "org/blueberry" = {
      tray-enabled = true;
    };

    "org/blueman/network" = {
      nap-enable = false;
    };

    "org/gnome/Console" = {
      font-scale = 1.0;
      theme = "auto";
    };

    "org/gnome/TextEditor" = {
      show-grid = false;
      style-scheme = "peninsula-dark";
      use-system-font = false;
    };

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-size = mkTuple [ 759 600 ];
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-keyboard-enabled = false;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/ap/.local/share/backgrounds/2022-09-04-15-15-22-1080p.jpg";
      picture-uri-dark = "file:///home/ap/.local/share/backgrounds/2022-09-04-15-15-22-1080p.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "compose:caps" ];
    };

    "org/gnome/desktop/interface" = {
      clock-show-weekday = false;
      color-scheme = "prefer-dark";
      cursor-size = 32;
      cursor-theme = "Simp1e-Catppuccin-Frappe";
      document-font-name = "Cabin 11";
      font-antialiasing = "rgba";
      font-hinting = "full";
      font-name = "Cabin 11";
      gtk-theme = "Catppuccin-dark";
      icon-theme = "Tela-black-dark";
      monospace-font-name = "JetBrainsMono Nerd Font 11";
      show-battery-percentage = true;
      text-scaling-factor = 1.25;
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "discord" "code" "org-gnome-nautilus" "org-gnome-texteditor" "org-gnome-settings" "signal-desktop" "gnome-power-panel" "bitwarden" ];
    };

    "org/gnome/desktop/notifications/application/bitwarden" = {
      application-id = "bitwarden.desktop";
    };

    "org/gnome/desktop/notifications/application/code" = {
      application-id = "code.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-texteditor" = {
      application-id = "org.gnome.TextEditor.desktop";
    };

    "org/gnome/desktop/notifications/application/signal-desktop" = {
      application-id = "signal-desktop.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/ap/.local/share/backgrounds/2022-09-04-15-15-22-1080p.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close,minimize,maximize:appmenu";
      titlebar-font = "Cabin 12";
    };

    "org/gnome/eog/view" = {
      background-color = "rgb(0,0,0)";
      use-background-color = true;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "resources";
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-state = mkTuple [ 1378 817 ];
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'org.gnome.Geary.desktop': <{'position': <0>}>, 'org.gnome.Contacts.desktop': <{'position': <1>}>, 'org.gnome.Weather.desktop': <{'position': <2>}>, 'org.gnome.clocks.desktop': <{'position': <3>}>, 'org.gnome.Maps.desktop': <{'position': <4>}>, 'org.gnome.Photos.desktop': <{'position': <5>}>, 'org.gnome.Totem.desktop': <{'position': <6>}>, 'org.gnome.Calculator.desktop': <{'position': <7>}>, 'android-file-transfer.desktop': <{'position': <8>}>, 'simple-scan.desktop': <{'position': <9>}>, 'org.gnome.Settings.desktop': <{'position': <10>}>, 'beekeeper-studio.desktop': <{'position': <11>}>, 'org.gnome.Terminal.desktop': <{'position': <12>}>, 'Utilities': <{'position': <13>}>, 'yelp.desktop': <{'position': <14>}>, 'calibre-gui.desktop': <{'position': <15>}>, 'org.gnome.Cheese.desktop': <{'position': <16>}>, 'darktable.desktop': <{'position': <17>}>, 'sqlitebrowser.desktop': <{'position': <18>}>}, {'calibre-ebook-edit.desktop': <{'position': <0>}>, 'calibre-ebook-viewer.desktop': <{'position': <1>}>, 'element-desktop.desktop': <{'position': <2>}>, 'org.gnome.Extensions.desktop': <{'position': <3>}>, 'gimp.desktop': <{'position': <4>}>, 'org.inkscape.Inkscape.desktop': <{'position': <5>}>, 'insomnia.desktop': <{'position': <6>}>, 'julia.desktop': <{'position': <7>}>, 'fi.skyjake.Lagrange.desktop': <{'position': <8>}>, 'calibre-lrfviewer.desktop': <{'position': <9>}>, 'cups.desktop': <{'position': <10>}>, 'nixos-manual.desktop': <{'position': <11>}>, 'obsidian.desktop': <{'position': <12>}>, 'onlyoffice-desktopeditors.desktop': <{'position': <13>}>, 'com.github.jeromerobert.pdfarranger.desktop': <{'position': <14>}>, 'pavucontrol.desktop': <{'position': <15>}>, 'ranger.desktop': <{'position': <16>}>, 'skypeforlinux.desktop': <{'position': <17>}>, 'slack.desktop': <{'position': <18>}>}, {'org.gnome.TextEditor.desktop': <{'position': <0>}>, 'org.gnome.Tour.desktop': <{'position': <1>}>, 'virt-manager.desktop': <{'position': <2>}>, 'vlc.desktop': <{'position': <3>}>, 'Waydroid.desktop': <{'position': <4>}>, 'whatsapp-for-linux.desktop': <{'position': <5>}>, 'nvim.desktop': <{'position': <6>}>, 'Write.desktop': <{'position': <7>}>, 'com.github.xournalpp.xournalpp.desktop': <{'position': <8>}>, 'xterm.desktop': <{'position': <9>}>, 'Zoom.desktop': <{'position': <10>}>, 'org.gnome.Music.desktop': <{'position': <11>}>, 'org.gnome.Epiphany.desktop': <{'position': <12>}>}]";
      disable-user-extensions = false;
      disabled-extensions = [ ];
      enabled-extensions = [ "tweaks-system-menu@extensions.gnome-shell.fifi.org" "user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "gnome-system-monitor.desktop" "org.gnome.Calendar.desktop" "Mailspring.desktop" "tutanota-desktop.desktop" "foot.desktop" "Alacritty.desktop" "brave-browser.desktop" "firefox.desktop" "chromium-browser.desktop" "torbrowser.desktop" "telegramdesktop.desktop" "signal-desktop.desktop" "code.desktop" "discord.desktop" "github-desktop.desktop" "bitwarden.desktop" "virtualbox.desktop" ];
      had-bluetooth-devices-setup = true;
      remember-mount-password = false;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.8;
      dash-max-icon-size = 32;
      dock-position = "BOTTOM";
      extend-height = false;
      height-fraction = 0.9;
      icon-size-fixed = true;
      preview-size-scale = 0.0;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-dark";
    };

    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      audible-bell = false;
      background-color = "rgb(23,20,33)";
      cell-height-scale = 1.1500000000000001;
      foreground-color = "rgb(208,207,204)";
      palette = [ "rgb(23,20,33)" "rgb(192,28,40)" "rgb(38,162,105)" "rgb(162,115,76)" "rgb(18,72,139)" "rgb(163,71,186)" "rgb(42,161,179)" "rgb(208,207,204)" "rgb(94,92,100)" "rgb(246,97,81)" "rgb(51,209,122)" "rgb(233,173,12)" "rgb(42,123,222)" "rgb(192,97,203)" "rgb(51,199,222)" "rgb(255,255,255)" ];
      use-theme-colors = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 189;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-size = mkTuple [ 1082 542 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 185;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 0 0 ];
      window-size = mkTuple [ 941 955 ];
    };

    "system/proxy" = {
      mode = "none";
    };

  };
}
