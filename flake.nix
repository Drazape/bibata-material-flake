{
	description = "28 Bibata cursor themes, colored using Material Design 3's tonal system";

	inputs = {
		flake-parts = { type="github"; owner="hercules-ci"; repo="flake-parts"; };
		nixpkgs = { type="github"; owner="NixOS"; repo="nixpkgs"; ref="nixpkgs-unstable"; };
		bibata-material-cursors = {
			url = "https://github.com/SakibShahariar/material-bibata-cursor/releases/download/v1.0.0/bibata-material-v1.0.0.tar.gz";
			flake = false;
		};
	};

	outputs = inputs@{ flake-parts, ... }:
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-linux" ];
			perSystem = { config, self', inputs', pkgs, lib, system, ... }: {
				packages = let pkgName = "bibata-material-cursors"; in {
					default = self'.packages.${pkgName};
					${pkgName} = pkgs.stdenvNoCC.mkDerivation {
						name = pkgName;
						src = inputs.bibata-material-cursors;

						installPhase = ''
							install_path=$out/share/icons
							${lib.getExe' pkgs.coreutils "mkdir"} --parents -- $install_path
							${lib.getExe' pkgs.coreutils "cp"} --recursive --no-target-directory -- $src $install_path
						'';

						meta = {
							description = "28 Bibata cursor themes, colored using Material Design 3's tonal system";
							homepage = "https://github.com/SakibShahariar/bibata-material-cursors";
							license = lib.licenses.gpl3;
							platforms = lib.platforms.linux;
						};
					};
				};
			};
		};
}		 
