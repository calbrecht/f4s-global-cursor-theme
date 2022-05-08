{
  description = "A global cursor theme";

  nixConfig = {
    flake-registry = https://github.com/calbrecht/f4s-registry/raw/main/flake-registry.json;
  };

  outputs = inputs: {

    overlay = final: prev: {

      global-cursor-theme = prev.stdenv.mkDerivation {
        name = "global-cursor-theme";
        unpackPhase = "true";
        outputs = [ "out" ];

        installPhase = ''
          mkdir -p $out/share/icons/default
          cat << EOF > $out/share/icons/default/index.theme
          [Icon Theme]
          Name=Default
          Comment=Default Cursor Theme
          Inherits=Paper
          EOF
        '';
      };
    };
  };
}
