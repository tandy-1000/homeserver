# homeserver

A nixOS config for a RockPro64 NAS.

Services:
- TBA

Packages:
- ffmpeg-full with RKMPP

TODO:
- enable github actions for image building

```
$ nix-build '<nixpkgs/nixos>' -A config.system.build.sdImage -I nixos-config=./configuration.nix --argstr system aarch64-linux
```
