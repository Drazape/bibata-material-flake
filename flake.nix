{
	description = "28 Bibata cursor themes, colored using Material Design 3's tonal system";

	inputs = {
		flake-parts = { type="github"; owner="hercules-ci"; repo="flake-parts"; };
		nixpkgs = { type="github"; owner="NixOS"; repo="nixpkgs"; ref="nixpkgs-unstable"; };
		bibata-material-cursors-Light = {
			url = "https://github.com/SakibShahariar/material-bibata-cursor/releases/download/v1.3.0/bibata-material-light-v1.3.0.tar.gz";
			flake = false;
		};
		bibata-material-cursors-Dark = {
			url = "https://github.com/SakibShahariar/material-bibata-cursor/releases/download/v1.3.0/bibata-material-dark-v1.3.0.tar.gz";
			flake = false;
		};
	};

	outputs = inputs@{ flake-parts, ... }:
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-linux" ];
			perSystem = { self', pkgs, ... }: {
				packages = let pkgName = "bibata-material-cursors"; in {
					default = self'.packages.${pkgName};
					${pkgName} = pkgs.callPackage ./pkg.nix { inherit inputs; };
				};
			};
		};
}		 
