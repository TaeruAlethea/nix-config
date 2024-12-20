{inputs,config, ...}:
{
  imports = [
    ./modules/sops
  ];

  users.mutableUsers = false; # Required for Sops
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.astraeaf = {
    description = "Astraea Falke";
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.astraeaf-password.path;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}