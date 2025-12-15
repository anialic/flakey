{ lib, config, ... }:
{
  flake.lib.allHostNames = lib.mapAttrsToList (name: _: name) config.nodes;
}
