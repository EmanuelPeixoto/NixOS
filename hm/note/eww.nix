{ pkgs, ... }:
{
    home.packages = with pkgs; [
      socat
    ];

  programs.eww = {
    enable = true;
    configDir = ./eww;
  };

  systemd.user.services.eww = {
    Unit = {
      Description = "Eww Daemon";
    };
    Service = {
      ExecStart = "${pkgs.eww}/bin/eww daemon --no-daemonize";
      Restart = "no";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
