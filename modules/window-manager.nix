{ inputs, ... }:
{
  flake.modules.nixos.window-manager = {
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "niri-session";
          user = "astraeaf";
        };
        default_session = initial_session;
      };
    };

    imports = with inputs.self.modules.nixos; [
      niri
    ];
  };

  flake.modules.homeManager.window-manager = {
    imports = with inputs.self.modules.homeManager; [
      niri
      dankMaterialShell
      wezterm
    ];
  };
}
