{ lib, config, ... }:
{
  rules =
    let
      nixosNodes = lib.filterAttrs (
        _: n: (n._target or (if lib.hasSuffix "-darwin" n._system then "darwin" else "nixos")) == "nixos"
      ) config.nodes;
    in
    [
      {
        assertion = lib.all (n: n.base.enable or false) (lib.attrValues nixosNodes);
        message = "All NixOS nodes must enable base module";
      }
    ];
}
