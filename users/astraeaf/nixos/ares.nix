{
	users.mutableUsers = false; # Required for Sops
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.astraeaf = {

    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.astraeaf-password.path;
    description = "Astraea Falke";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # openssh.authorizedKeys.keyFiles = [ ./ssh/id_ed25519 ];
    packages = with pkgs; [
      kdePackages.kate

      firefox-wayland
      obsidian
      vesktop
      inputs.zen-browser.packages."${system}".default
    ];
  };
  }