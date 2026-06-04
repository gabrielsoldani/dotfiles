let
  flake = builtins.getFlake (toString ../.);

  mkOutput = name: attr: {
    inherit name attr;
  };

  darwinOutputs = builtins.map (name: mkOutput name "darwinConfigurations.${name}.system") (
    builtins.attrNames (flake.darwinConfigurations or { })
  );

  nixosOutputs = builtins.map (
    name: mkOutput name "nixosConfigurations.${name}.config.system.build.toplevel"
  ) (builtins.attrNames (flake.nixosConfigurations or { }));

  outputs = darwinOutputs ++ nixosOutputs;
in
if outputs == [ ] then builtins.throw "No diffable outputs found in flake." else outputs
