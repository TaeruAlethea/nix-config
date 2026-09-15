{ inputs, ... }:
{
  flake-file.inputs.septabee-daw = {
    url = "github:Ap6661/septabee-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
	
  flake.modules.nixos.septabee-daw = 
    { ... }:
    {
      imports = [ inputs.septabee-daw.nixosModules.default ];

      programs.septabee = {
        enable = true;
        version = "latest";
        wayland-deps = true;
        offline = true;
      };
    };
}
