{lib, config, pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  home.packages = with pkgs; [
    aircrack-ng
    arduino
    arduino-cli
    audacity
    curl
    discord
    elixir
    exfatprogs
    f3
    ffmpeg
    firefox
    gcc
    gdb
    gh
    gimp
    git
    glibc
    glxinfo
    gnumake
    gnupg
    go
    gotty
    gparted
    htop
    iftop
    jdk
    jmtpfs
    killall
    libmtp
    libreoffice
    libva-utils
    lm_sensors
    lshw
    mixxx
    mpv
    ncmpcpp
    neofetch
    netcat
    nload
    nmap
    nodejs_20
    nomacs
    obs-studio
    openshot-qt
    pamixer
    paprefs
    pavucontrol
    pciutils
    pkg-config
    playerctl
    pmutils
    postgresql
    prismlauncher
    progress
    pulseaudioFull
    qbittorrent
    racket
    ranger
    speedtest-cli
    stress
    telegram-desktop
    texliveFull
    thunderbird
    tor
    tor-browser-bundle-bin
    unrar
    unzip
    usbutils
    ventoy-full
    vlc
    vulkan-tools
    wget
    wine
    yt-dlp
    zathura
    zip
  ];
}
