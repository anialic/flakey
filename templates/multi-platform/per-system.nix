{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      formatter = pkgs.nixfmt-rfc-style;
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          nil
          nixfmt-rfc-style
        ];
      };
    };
}
