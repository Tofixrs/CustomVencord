self': {
  # allow overriding electron
  electron,
  webcord,
  substituteAll,
}:
# nixpkgs-update: no auto update
(webcord.override {inherit electron;}).overrideAttrs (old: {
  pname = "webcord-custom-vencord";

  patches =
    (old.patches or [])
    ++ [
      (substituteAll {
        src = ./add-extension.patch;
        vencord = self'.packages.custom-vencord.override {firefox = false;};
      })
    ];

  meta = {
    inherit (old.meta) license mainProgram platforms;

    description = "Webcord with Vencord web extension";
  };
})
