{ lib, ... }:
{
  modules.base = {
    target = "nixos";
    options = {
      hostName = lib.mkOption { type = lib.types.str; };
      timeZone = lib.mkOption {
        type = lib.types.str;
        default = "UTC";
      };
    };
    module =
      { node, ... }:
      {
        networking.hostName = node.base.hostName;
        time.timeZone = node.base.timeZone;
        system.stateVersion = "24.11";
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
      };
  };
}
