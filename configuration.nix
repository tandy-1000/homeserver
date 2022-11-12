{ config, pkgs, ... }:

{
  nixpkgs.crossSystem.system = "aarch64-linux";

  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
  ];

  include = [
    ./modules/network.nix
    ./modules/packages.nix
    ./modules/rkmpp.nix
  ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  users.users.tandy = {
    isNormalUser = true;
    home = "/home/tandy";
    extraGroups = [ "wheel" "sudo" ];
    # openssh.authorizedKeys.keys = [ "INSERT KEY" ];
  };
}
