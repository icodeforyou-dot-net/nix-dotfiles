{ stdenv
, fetchurl
, lib
}:

stdenv.mkDerivation rec {
  pname = "simp1e-cursor-theme-catppuccin-frappe";
  version = "20220903";


  src = fetchurl {
    url = "https://gitlab.com/cursors/simp1e/-/jobs/3269567407/artifacts/raw/built_themes/Simp1e-Catppuccin-Frappe.tgz";
    sha256 = "";
  };

  # phases = "unpackPhase installPhase";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r Simp1e-Catppuccin-Frappe/ $out/share/icons/Simp1e-Catppuccin-Frappe
    runHook postInstall
  '';

  meta = with lib; {
    description = "Simp1e cursor theme using the Catppuccin frappe color palette";
    homepage = "https://gitlab.com/cursors/simp1e";
    license = licenses.gpl3;
    platforms = platforms.all;
    maintainers = with maintainers; [ ];
  };
}
