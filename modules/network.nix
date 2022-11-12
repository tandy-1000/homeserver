{ config, pkgs, ... }:

{
  networking.hostName = "server";

  networking.firewall.enable = true;
}
