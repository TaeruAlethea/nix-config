{ inputs, ... }:
{
  flake-file.inputs.septabee-daw = {
    url = "github:TaeruAlethea/septabee-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
	
  flake.modules.nixos.septabee-daw =
    { ... }:
    {
			# Realtime Thread Priority 
      imports = [ inputs.septabee-daw.nixosModules.default ];

      # Actually install the package
      environment.systemPackages = [ inputs.septabee-daw.packages.default ];
    };
}
