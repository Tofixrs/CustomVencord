_: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages.default = pkgs.callPackage (import ./webcord-vencord self') {};
    packages.custom-vencord = pkgs.callPackage ./vencord.nix {};
  };
}
