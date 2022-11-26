{ stdenv
, lib
, fetchurl
, autoPatchelfHook
, wrapGAppsHook
  # , gnome
  # , libsecret
  # , git
  # , curl
  # , nss
  # , nspr
  # , xorg
  # , libdrm
  # , alsa-lib
  # , cups
  # , mesa
  # , systemd
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
    wrapGAppsHook
  ];

  buildInputs = [
    # gnome.gnome-keyring
    # xorg.libXdamage
    # xorg.libX11
    # libsecret
    # git
    # curl
    # nss
    # nspr
    # libdrm
    # alsa-lib
    # cups
    # mesa
  ];

  sourceRoot = ".";

  unpackPhase = ''
    mkdir -p $TMP/${pname} $out/{opt,bin}
    cp $src $TMP/${pname}.deb
    ar vx ${pname}.deb
    pwd
    ls -la
    tar --no-overwrite-dir -xvf control.tar.xz -C $TMP/${pname}/
    tar --no-overwrite-dir -xvf data.tar.xz -C $TMP/${pname}/
  '';

  installPhase = ''
    cp -R $TMP/${pname}/usr/share $out/
    cp -R $TMP/${pname}/usr/lib/${pname}/* $out/opt/
    ln -sf $out/opt/${pname} $out/bin/${pname}
  '';

  # runtimeDependencies = [
  #   (lib.getLib systemd)
  # ];

  meta = with lib; {
    description = "An electron based reader for TLG and PHI databases.";
    homepage = "https://d.iogen.es";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
