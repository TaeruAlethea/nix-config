{ inputs, ... }:
{
  flake.modules.homeManager.user_astraeaf_hera =
    { ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        system_base
      ];
    };
}
