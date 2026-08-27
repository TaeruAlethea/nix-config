{ inputs, lib, ... }:{
	flake-file.inputs.nix-minecraft = {
    url = "github:Infinidoge/nix-minecraft";
  };

  flake.modules.nixos.minecraftServer = { pkgs, ... }:{
    imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;
      dataDir = "/var/lib/minecraft/";

      servers =
      let
        allofcreate = { packwiz, stdenv, fetchurl  }: stdenv.mkDerivation {
          name = "allOfCreatePackwiz";
          version = "2.4";
          src = fetchurl {
            url = "https://www.curseforge.com/api/v1/mods/1518930/files/8669802/download";
            hash = "";
          };
          nativeBuildInputs = [ packwiz ];

          unpackPhase = ''
            ls -a
            packwiz cursforge import $src
            '';

          installPhase = ''
            mv . $out/
            '';
   	    };
		    allofcreatePackage = pkgs.callPackage allofcreate;
      in
      {
        AllOfCreate =
       	let
       	     modpack = pkgs.fetchPackwizModpack {
  				    src = "${allofcreatePackage}/pack.toml";
  				  };
  				  mcVersion = modpack.manifest.versions.minecraft;
  				  neoforgeVersion = modpack.manifest.versions.neoforge;
  				  serverVersion = lib.replaceStrings [ "." ] [ "_" ] "neoforge-${mcVersion}";
       	in
       	{
          enable = true;
          package = pkgs.neoforgeServers.${serverVersion}.override { loaderVersion = neoforgeVersion; };

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
