{ lib, ... }:
{
  modules.deploy = {
    options = {
      hostname = lib.mkOption { type = lib.types.str; };
      sshUser = lib.mkOption {
        type = lib.types.str;
        default = "root";
      };
    };
  };
}
