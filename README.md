Nix flake for the binary package of the [Bibata Material Cursors](https://github.com/SakibShahariar/material-bibata-cursor/ "28 Bibata cursor themes, colored using Material Design 3's tonal system") cursor pack.

# Installation Instructions
1. Add the input to your `flake.nix`
```nix
inputs = {
	…
	bibata-material-cursors = {
		type="github"; owner="drazape"; repo="bibata-material-flake";
		inputs.nixpkgs.follows = "nixpkgs"; # optional
	};
	…
};
…
```

Simply install the `default` package in your system environment from the added input in a module.
```nix
environment.systemPackages = [
	…
	inputs.bibata-material-cursors.packages.${pkgs.stdenvNoCC.hostPlatform.system}.default
	…
];
```

# Limiting Variants
By default, the package installs all the [cursor variants](https://github.com/SakibShahariar/material-bibata-cursor#themes "Preview of custom variants"). You can select which cursor variants to install by specifying the [variant names](./pkg.nix#L6 "A list of variant names from the pkg source") as an override  
> [!NOTE]
> ```diff
> - inputs.bibata-material-cursors.packages.${pkgs.stdenvNoCC.hostPlatform.system}.default
> + (inputs.bibata-material-cursors.packages.${pkgs.stdenvNoCC.hostPlatform.system}.default.override {variants=[<variants>];})
> ```

# Internal Working
1. The flake gets the pre-build cursors from the release assets by using the URL in the `inputs`
2. It uses [*flake-parts*](https://flake.parts/) to declare the package for Linux
3. It uses the standard environment from *Nixpkgs* to make a derivation
