{}:
{
  nixosConfigurations = {
    hostname = lib.nixosSystem
      {
        inherit system;
        modules = [
          hyprland.nixosModules.default
          {
            programs.hyprland = {
              enable = true;
              package = hyprland.packages.${pkgs.system}.default.overrideAttrs (old: {
                nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
                postInstall = ''
                  wrapProgram $out/bin/Hyprland \
                    --set NIXOS_OZONE_WL 1 \
                    --set GDK_BACKEND wayland \
                    --set _JAVA_AWT_WM_NONREPARENTING 1 \
                    --set XDG_SESSION_TYPE wayland
                '';
              });
            };
            environment.sessionVariables.NIXOS_OZONE_WL = "0";
          }
        ];
      };
  };
}
