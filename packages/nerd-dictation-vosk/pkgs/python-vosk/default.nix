{ buildPythonPackage
, fetchPypi
, cffi
, srt
, tqdm
, requests
, websockets
, substituteAll
, vosk-api
, lib
}:

buildPythonPackage rec {
  pname = "vosk";
  version = "0.3.45";
  # inherit (vosk-api) src version;
  src = fetchPypi {
    inherit pname version;
    sha256 = "";
  };

  patches = [
    (substituteAll {
      src = ./fix-paths.patch;
      vosk_api = vosk-api;
    })
  ];

  propagatedBuildInputs = [
    cffi
    srt
    tqdm
    requests
    websockets
  ];

  # No tests.
  doCheck = false;

  pythonImportsCheck = [
    "vosk"
  ];

  postPatch = ''
    cd python
  '';

  meta = with lib; {
    description = "Python bindings for VOSK API";
    homepage = "https://github.com/alphacep/vosk-api";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
