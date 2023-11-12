{ stdenv
, lib
, fetchurl
, autoPatchelfHook
, wrapGAppsHook
, makeWrapper
, gnome
, libsecret
, git
, curl
, nss
, nspr
, xorg
, libdrm
, alsa-lib
, cups
, mesa
, systemd
, openssl
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
    (wrapGAppsHook.override { inherit makeWrapper; })
  ];

  buildInputs = [
    xorg.libXdamage
    xorg.libX11
    libsecret
    git
    curl
    nss
    nspr
    libdrm
    cups
    mesa
    openssl
  ];



  unpackPhase = ''
    mkdir -p $TMP/diogenes-${version} $out/{opt,bin}
    cp $src $TMP/$diogenes-${version}.deb
    ar vx diogenes-${version}.deb
    tar --no-overwrite-dir -xvf data.tar.xz -C $TMP/diogenes-${version}/
  '';

  installPhase = ''
    cp -R $TMP/diogenes-${version}/usr/share $out/
    cp -R $TMP/diogenes-${version}/usr/lib/diogenes-${version}/* $out/opt/
    ln -sf $out/opt/diogenes $out/bin/diogenes
  '';

  preFixup = ''
    gappsWrapperArgs+=(
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland}}"
    )
  '';

  runtimeDependencies = [
    (lib.getLib systemd)
  ];

  meta = {
    description = "Diogenes: an environment for reading Latin and Greek";
    longDescription = ''
      An electron based reader for TLG and PHI databases (among others) for Greek and Latin texts.
    '';
    homepage = "https://d.iogen.es";
    changelog = "https://github.com/pjheslin/diogenes/releases/tag/${version}";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
