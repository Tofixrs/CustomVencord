_: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages.custom-vencord = pkgs.callPackage ./vencord.nix {};
    packages.default = self'.packages.custom-vencord;
  };
}
