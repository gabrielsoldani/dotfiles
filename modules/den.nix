{ den, inputs, ... }:

{
  imports = [
    inputs.den.flakeModule
    (inputs.den.namespace "gabriel" true)
  ];

  den.schema.user.includes = [
    den.batteries.define-user
    den.batteries.host-aspects
  ];
}
