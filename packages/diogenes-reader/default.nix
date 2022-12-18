{ stdenv
, lib
, fetchurl
, autoPatchelfHook
, dpkg
, wrapGAppsHook
, makeWrapper
, nixosTests
, gtk3
, atk
, at-spi2-atk
, cairo
, pango
, gdk-pixbuf
, glib
, freetype
, fontconfig
, dbus
, libX11
, xorg
, libXi
, libXcursor
, libXdamage
, libXrandr
, libXcomposite
, libXext
, libXfixes
, libXrender
, libXtst
, libXScrnSaver
, nss
, nspr
, alsa-lib
, cups
, expat
, libuuid
, at-spi2-core
, libappindicator-gtk3
, mesa
  # Runtime dependencies:
, systemd
  # libnotify, libdbusmenu, libpulseaudio, xdg-utils
}:

stdenv.mkDerivation rec {
  pname = "diogenes-reader";
  version = "4.6.2";

  src = fetchurl {
    url = "https://github.com/pjheslin/diogenes/releases/download/${version}/diogenes-${version}_amd64.deb";
    sha256 = "16vr4l08cfngvw6nxq8v1m435jld6hnvx22qbdnwrl2g2bsr0b56";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    dpkg
    (wrapGAppsHook.override { inherit makeWrapper; })
  ];

  buildInputs = [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk3
    libX11
    libXScrnSaver
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXfixes
    libXi
    libXrandr
    libXrender
    libXtst
    libappindicator-gtk3
    libnotify
    libuuid
    mesa # for libgbm
    nspr
    nss
    pango
    systemd
    xorg.libxcb
    xorg.libxshmfence
  ];

  runtimeDependencies = [
    (lib.getLib systemd)
    # libappindicator-gtk3
    # libnotify
    # libdbusmenu
    # xdg-utils
  ];

  unpackPhase = "dpkg-deb -x $src .";

  dontBuild = true;
  dontConfigure = true;
  #dontPatchELF = true;
  # We need to run autoPatchelf manually with the "no-recurse" option, see
  # https://github.com/NixOS/nixpkgs/pull/78413 for the reasons.
  #dontAutoPatchelf = true;

  installPhase = ''
    runHook preInstall
    # mkdir -p $out/lib
    # mv usr/share $out/share
    # mv opt/Signal $out/lib/Signal
    # Note: The following path contains bundled libraries:
    # $out/lib/Signal/resources/app.asar.unpacked/node_modules/sharp/vendor/lib/
    # We run autoPatchelf with the "no-recurse" option to avoid picking those
    # up, but resources/app.asar still requires them.
    # Symlink to bin
    mkdir -p $out/bin
    ln -s $out/local/diogenes/diogenes $out/bin/diogenes
    # Create required symlinks:
    ln -s libGLESv2.so $out/local/diogenes/libGLESv2.so.2
    runHook postInstall
  '';

  # preFixup = ''
  #   gappsWrapperArgs+=(
  #     --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ stdenv.cc.cc ] }"
  #     --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"
  #     --suffix PATH : ${lib.makeBinPath [ xdg-utils ]}
  #   )cd
  #   # Fix the desktop link
  #   substituteInPlace $out/share/applications/diogenes.desktop \
  #     --replace /opt/Signal/signal-desktop $out/bin/signal-desktop
  #   autoPatchelf --no-recurse -- $out/lib/Signal/
  #   patchelf --add-needed ${libpulseaudio}/lib/libpulse.so $out/lib/Signal/resources/app.asar.unpacked/node_modules/ringrtc/build/linux/libringrtc-x64.node
  # '';

  meta = {
    description = "Diogenes: an environment for reading Latin and Greek";
    longDescription = ''
      An electron based reader for TLG and PHI databases (among others) for Greek and Latin texts.
    '';
    homepage = "https://d.iogen.es";
    changelog = "https://github.com/pjheslin/diogenes/releases/tag/${version}";
    license = lib.licenses.gpl3;
    # maintainers = with lib.maintainers; [ ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
