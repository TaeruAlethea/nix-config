{ ... }:{
    services.displayManager = {
        autoLogin.enable = true;
        autoLogin.user = "astraeaf";
        sddm = {
            enable = true;
            wayland.enable = true;
            settings.autoLogin.relogin = true;
        };
    };
}