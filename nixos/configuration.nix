{lib, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./apps.nix
      ./hotspot.nix
      ./intel.nix
      ./ngrok.nix
      ./sound.nix
    ];

  # Boot
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = false;

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hostname
  networking.hostName = "nixos";


  # Networking
  networking.networkmanager.enable = true;

  # Time Zone
  time.timeZone = "America/Sao_Paulo";

  i18n = {
    defaultLocale = "pt_BR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  services.xserver = {
    enable = true;
    exportConfiguration = true;

    layout = "br";
    xkbVariant = "";
    xkbModel = "";

    displayManager.lightdm.greeters.slick.enable = true;
    desktopManager.xterm.enable = false;

    windowManager.i3.enable = true;

    libinput = {
      enable = true;

      mouse = {
        accelProfile = "flat";
      };

      touchpad = {
        accelProfile = "flat";
        accelSpeed = "0.65";
      };
    };
  };

  # Console keymap
  console.keyMap = "br-abnt2";

  users.users.emanuel = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Emanuel Peixoto";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  fonts = {packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Meslo" ];})
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "MesloLGSNerdFontMono" ];
        sansSerif = [ "MesloLGSNerdFont" ];
        monospace = [ "MesloLGSNerdFont" ];
      };
    };
  };


  services = {
    openssh.enable = true;
    vnstat.enable = true;
    blueman.enable = true;
    logind.lidSwitch = "lock";
    teamviewer.enable = true;
  };

  programs.dconf.enable = true;
  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  hardware.bluetooth.enable = true;

  networking.firewall.allowedTCPPorts = [ 6600 8080 ]; # MPD
  networking.firewall.allowedUDPPorts = [ ];

  system.stateVersion = "23.05";

}
