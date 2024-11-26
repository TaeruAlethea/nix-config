# todo: Still a partial stub.

{
    pkgs,
    inputs,
    config,
    lib,
    configVars,
    configLib,
    ...
}:
let
in
{
    config =
        lib.recursiveUpdate fullUserConfig
        {
            users.mutableUsers = false;
            users.users.${configVars.username} ={
                home = "/home/${configVars.username}";
                isNormalUser = true;
                password = "nixos"; # Overridden if sops is working
                
                extraGroups =
                    [ "wheel" ]
                    ++ ifTheyExist [
                        "audio"
                        "video"
                        "docker"
                        "git"
                        "networkmanager"
                        "scanner" # for print/scan"
                        "lp" # for print/scan"
                    ];

                # These get placed into /etc/ssh/authorized_keys.d/<name> on nixos
                openssh.authorizedKeys.keys = lib.lists.forEach pubKeys (key: builtins.readFile key);

                shell = pkgs.bash; # default shell
        }
        # create ssh sockets directory for controlpaths when homemanager not loaded (i.e. isminimal)
        systemd.tmpfiles.rules =
            let
                user = config.users.users.${configVars.username}.name;
                group = config.users.users.${configVars.username}.group;
            in
            [ "d /home/${configVars.username}/.ssh/sockets 0750 ${user} ${group} -" ];

        # No matter what environment we are in we want these tools for root, and the user(s)
        programs.bash.enable = true;
        programs.git.enable = true;
        environment.systemPackages = [
            pkgs.just
            pkgs.rsync
        ];
    };
}
