{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [ (import ./../overlays/ffmpeg-rkmpp.nix) ];

  environment.systemPackages = [ pkgs.ffmpeg-full ];

  services.udev.extraRules = ''
  KERNEL=="mali", MODE="0660", GROUP="video"
  KERNEL=="rkvdec", MODE="0660", GROUP="video"
  KERNEL=="vpu-service", MODE="0660", GROUP="video"
  '';
}