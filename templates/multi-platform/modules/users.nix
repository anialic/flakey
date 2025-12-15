{ lib, ... }:
{
  modules.base.options.user = lib.mkOption { type = lib.types.str; };
  modules.base.module =
    { node, ... }:
    {
      users.users.${node.base.user} = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
        initialPassword = "changeme";
      };
    };
}
