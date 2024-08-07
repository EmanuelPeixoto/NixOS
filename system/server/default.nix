{ ... }:
{
  imports = [
    ../flake-config.nix
    ../locale.nix
    ./acme.nix
    ./apps.nix
    ./firewall.nix
    ./go-scti.nix
    ./hardware-configuration.nix
    ./nextcloud.nix
    ./nginx.nix
    ./noip.nix
    # ./nvidia.nix
    ./php.nix
    ./qbittorrent.nix
    ./ssh.nix
    ./swap.nix
    ./users.nix
  ];

  # Hostname
  networking.hostName = "NixOS-Server";

  # Boot
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = false;

  # Networking
  networking.networkmanager.enable = true;

  programs = {
    dconf.enable = true;
    zsh.enable = true;
  };

  services = {
    vnstat.enable = true;
  };

  system.stateVersion = "23.11";
}
