# NUR Flake Wrapper

This repository provides a wrapper around NUR that allows you to use any packages directly.

## How to Use

Running an old Ida package:

``` console
$ nix shell --no-write-lock-file github:berbiche/nur-flake-wrapper#nur.repos.htr.idafree -c idafree
```

Adding a quick access link in your flake registry:

``` nix
{ config, pkgs, inputs, ... }:

{
  nix.registry.nur = {
    from = { type = "indirect"; id = "nur"; };
    to = { type = "github"; owner = "berbiche"; repo = "nur-flake-wrapper"; };

    # You can also pin it in your flake.nix inputs and use only the following line
    # (assuming you have added `inputs` in specialArgs or _module.args)
    # (I couldn't find any official documentation link unfortunately for the above)
    #flake = inputs.nur;
  };
}
```

Then:

``` console
$ nix shell --no-write-lock-file nur#nur.repos.htr.idafree -c idafree
```

I should probably just send a PR for this but the NUR repository does not have a flake.lock
and probably does not want to support it.

