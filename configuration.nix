{ config, pkgs, ... }:

{
  nixpkgs.crossSystem.system = "aarch64-linux";

  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
  ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  networking.hostName = "server";

  networking.firewall.enable = true;

  nixpkgs.overlays = [
    (import ./packages)
    (import ./overlays/ffmpeg-rkmpp.nix)
  ];

  environment.systemPackages = [ pkgs.ffmpeg-full ];

  services.udev.extraRules = ''
  KERNEL=="mali", MODE="0660", GROUP="video"
  KERNEL=="rkvdec", MODE="0660", GROUP="video"
  KERNEL=="vpu-service", MODE="0660", GROUP="video"
  '';

  users.users.tandy = {
    isNormalUser = true;
    home = "/home/tandy";
    extraGroups = [ "wheel" "sudo" ];
    # openssh.authorizedKeys.keys = [ "INSERT KEY" ];
  };
}
