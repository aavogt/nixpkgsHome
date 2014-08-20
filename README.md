# my ~/.nixpkgs
A set of haskell packages for multiple ghc versions mostly following <https://nixos.org/wiki/Haskell#Composing_Haskell_packages>.

This only works with nixpkgs from git as-of mid August 2014. In other words `~/.nix-defexpr/channels/nixpkgs` should refer to https://github.com/NixOS/nixpkgs or https://github.com/aavogt/nixpkgs

Install everything with

      nix-env -i all

Several environment variables need to be set (`PATH, NIX_GHC, NIX_GHCPKG`). This can be done with:

      . ~/.nix-profile/etc/profile.d/nix.sh
      if [ -e ~/.nix-profile/bin/ghc ]; then
           eval $(grep export ~/.nix-profile/bin/ghc)
      fi
