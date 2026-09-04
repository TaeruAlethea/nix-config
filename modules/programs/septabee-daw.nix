{ inputs, ... }:
{
  flake-file.inputs.septabee-daw = {
    url = "github:Ap6661/septabee-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
	
  flake.modules.nixos.septabee-daw = 
    { ... }:
    {
      imports = [ inputs.septabee-daw.nixosModules.x86_64-linux.default ];
      environment.systemPackages = [ inputs.septabee-daw.packages.x86_64-linux.default ];
    };
}
