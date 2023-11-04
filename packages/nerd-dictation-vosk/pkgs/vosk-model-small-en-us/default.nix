{ stdenv
, fetchzip
}:

stdenv.mkDerivation {
  name = "vosk-model-small-en-us";
  src = fetchzip {
    url = "https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip";
    sha256 = "sha256-CIoPZ/krX+UW2w7c84W3oc1n4zc9BBS/fc8rVYUthuY=";
  };
  dontBuild = true;
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out
  '';
}
