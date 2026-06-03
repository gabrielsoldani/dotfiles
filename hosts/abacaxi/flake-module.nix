{ inputs, self, ... }:

{
  flake.darwinConfigurations.abacaxi = inputs.nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = { inherit inputs self; };
    modules = [
      { home-manager.extraSpecialArgs = { inherit inputs; }; }
      inputs.home-manager.darwinModules.home-manager
      ./configuration.nix
    ];
  };
}
