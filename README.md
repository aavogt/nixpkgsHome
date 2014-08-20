# my ~/.nixpkgs
This is done following <https://nixos.org/wiki/Haskell#Composing_Haskell_packages>

Needs `$HOME/.nix-profile/bin in PATH. Also, several other environment
variables also need be set by:

      if [ -e ~/.nix-profile/bin/ghc ]; then
           eval $(grep export ~/.nix-profile/bin/ghc)
      fi

