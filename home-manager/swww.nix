{ pkgs, ... }:
{
  systemd.user.services.swww = {
    Unit = {
      Description = "Sww Daemon";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon --format xrgb";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
