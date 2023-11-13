{ lib
, stdenv
, fetchurl
, dpkg
, autoPatchelfHook
, makeWrapper
, electron
, alsa-lib
, gtk3
, libxshmfence
, mesa
, nss
, popt
}:

stdenv.mkDerivation rec {
  pname = "diogenes-reader";
  version = "4.6.2";

  src = fetchurl {
    url = "https://github.com/pjheslin/diogenes/releases/download/${version}/diogenes-${version}_amd64.deb";
    sha256 = "16vr4l08cfngvw6nxq8v1m435jld6hnvx22qbdnwrl2g2bsr0b56";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    gtk3
    libxshmfence
    mesa
    nss
    popt
  ];

  unpackPhase = ''
    dpkg-deb -x ${src} ./
  '';

  installPhase = ''
    mv usr $out
  '';

  libPath = lib.makeLibraryPath buildInputs;

  postFixup = ''
    makeWrapper ${electron}/bin/electron \
      $out/bin/diogenes \
      --prefix LD_LIBRARY_PATH : ${libPath}
  '';

  # runtimeDependencies = [
  #   (lib.getLib systemd)
  # ];

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
