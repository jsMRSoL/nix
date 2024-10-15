{ pkgs, ... }:
{
  xdg.configFile.sxhkdrc = {
    enable = true;
    target = "sxhkd/sxhkdrc";
    text = ''
      # restart daemons
      super + shift + r ; s
          ${pkgs.killall}/bin/killall sxhkd && sxhkd &

      # shutdown
      super + shift + Delete
          ${pkgs.systemd}/bin/systemctl poweroff

      # lock screen
      super + shift + s
          ${pkgs.slock}/bin/slock

      # brightness
      # XF86MonBrightnessDown
      #     brightness.sh down

      # XF86MonBrightnessUp
      #     brightness.sh up

      # volume
      # XF86AudioRaiseVolume
      #     pa-volup
          #volup

      # XF86AudioLowerVolume
      #     pa-voldown
          #voldown

      # XF86AudioMute
      #     pa-mute
          #volmute

      # XF86AudioPlay
      #     mpc toggle

      # XF86AudioStop
      #     mpc stop

      # XF86AudioNext
      #     mpc next

      # XF86AudioPrev
      #     mpc prev

      # screenshots
      # @Print
      #     screenshot.sh

      # super + Print
      #     screenshot-window.sh

      # dmenu-integrated scripts
      # super + shift + b
      #     bookmarklauncher.sh

      # launch gui programs
      super + x ; b
          ${pkgs.brave}/bin/brave

      super + x ; g
          ${pkgs.gimp}/bin/gimp

      F8
          ${pkgs.emacs}/bin/emacs

      ctrl + F8
          ${pkgs.emacs}/bin/emacs -f sp/open-with-tasks-and-capture

      # launch terminal programs
      super + x ; w
          ${pkgs.st}/bin/st -e w3m https://www.duckduckgo.com/lite

      super + x ; m
          ${pkgs.st}/bin/st -e ncmpcpp

      # launch yazi in specific folder
      super + r ; b
          ${pkgs.st}/bin/st -e yazi ~/.local/usr/bin

      super + r ; c
          ${pkgs.st}/bin/st -e yazi ~/.config

      super + r ; d
          ${pkgs.st}/bin/st -e yazi ~/Documents

      super + r ; h
          ${pkgs.st}/bin/st -e yazi ~

      super + r ; j
          ${pkgs.st}/bin/st -e yazi ~/Projects

      super + r ; m
          ${pkgs.st}/bin/st -e yazi ~/Music

      super + r ; o
          ${pkgs.st}/bin/st -e yazi ~/Downloads

      super + r ; p
          ${pkgs.st}/bin/st -e yazi ~/Pictures

      super + r ; v
          ${pkgs.st}/bin/st -e yazi ~/Videos
    '';
  };

  systemd.user.services.sxhkd = {
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Unit = {
      Description = "Run simple hotkey daemon";
      PartOf = "graphical-session.target";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.sxhkd}/bin/sxhkd";
      ExecReload = "${pkgs.util-linux}/bin/kill -SIGUSR1 $MAINPID";
    };
  };

  home.file.wallpaper = {
    enable = true;
    source = ../../../assets/nixos-wallpaper-catppuccin-mocha.png;
    target = ".background-image";
  };
}
