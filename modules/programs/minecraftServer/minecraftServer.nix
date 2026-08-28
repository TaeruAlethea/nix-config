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
      {
        vanillaServer = {
          enable = true;
          autoStart = true;
          openFirewall = true;
          package = pkgs.vanillaServers.vanilla;
          jvmOpts = "-Xms6144M -Xmx8192M";

          serverProperties = {
            server-port = 25566;
          };
        };
        
        AllOfCreate =
       	let
       	     modpack = pkgs.fetchzip {
  				    url = "https://edge.forgecdn.net/files/8669/802/All%20of%20Create%20-%20Aeronautics-v2.4.zip?api-key=267C6CA3";
  				    hash = "sha256-rHVoVNGJ0Q1ai4+CfSdWdMKdCYix/N5BoHJnlPZJ15w=";
  				    stripRoot = false;
  				  };
  				  mcVersion = "1.21.1";
  				  neoforgeVersion = "21.1.248";
  				  serverVersion = lib.replaceStrings [ "." ] [ "_" ] "neoforge-${mcVersion}-${neoforgeVersion}";
       	in
       	{
          enable = true;
          autoStart = true;
          openFirewall = true;
          package = pkgs.neoforgeServers.${serverVersion};
          jvmOpts = "-Xms6144M -Xmx8192M";

          serverProperties = {
            server-port = 25565;
          };
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
