{
  description = "System configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: 
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      lib = nixpkgs.lib;

    in {
      homeManagerConfigurations = {
        kurkotoff = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./users/kurkotoff/home.nix
            {
              home = {
                username = "kurkotoff";
                homeDirectory = "/home/kurkotoff";
                stateVersion = "22.05";
              };
            }
          ];
          };
        };

      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;

          modules = [
           ./system/configuration.nix
          ];
        };
      };
    };
}
