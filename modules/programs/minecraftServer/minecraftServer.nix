{ inputs, lib, ... }:{
	flake-file.inputs.nix-minecraft = {
    url = "github:Infinidoge/nix-minecraft";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.minecraftServer = { pkgs, ... }:{
imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    
    package = pkgs.minecraft-server-1-12;
    dataDir = "/var/lib/someotherdir";

    servers = {
      AllOfCreate =
      	let
				  modpack = pkgs.fetchPackwizModpack {
				    url = "./allOfCreate/pack.toml";
				    packHash = "";
				  };
				  mcVersion = modpack.manifest.versions.minecraft;
				  fabricVersion = modpack.manifest.versions.fabric;
				  serverVersion = lib.replaceStrings [ "." ] [ "_" ] "fabric-${mcVersion}";
      	in
      	{
        enable = true;
        package = pkgs.fabricServers.${serverVersion}.override { loaderVersion = fabricVersion; };

        serverProperties = {/* */};
        whitelist = {/* */};

        symlinks = {
          # Modpack example
          "mods" = "${modpack}/mods";
        };
      };
    };
  };
  };
}
