{ lib, ... }:
{
  modules.home = {
    target = "home";
    options = {
      username = lib.mkOption { type = lib.types.str; };
      directory = lib.mkOption {
        type = lib.types.str;
        default = "/home";
      };
    };
    module =
      { node, ... }:
      {
        home.username = node.home.username;
        home.homeDirectory = "${node.home.directory}/${node.home.username}";
        home.stateVersion = "24.11";
        programs.home-manager.enable = true;
      };
  };
}
