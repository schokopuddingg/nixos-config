{ self, inputs, ... }: {

  flake.nixosConfigurations.t470s = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.t470sConfig
    ];
  };

}
