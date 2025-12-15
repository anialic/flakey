{ lib, ... }:
{
  modules.darwin = {
    target = "darwin";
    options.hostName = lib.mkOption { type = lib.types.str; };
    module =
      { node, ... }:
      {
        networking.hostName = node.darwin.hostName;
        system.stateVersion = 5;
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
  };
}
