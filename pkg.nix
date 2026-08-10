{ inputs, pkgs, lib, ... }: pkgs.stdenvNoCC.mkDerivation {
	name = "bibata-material-cursors";
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
}
