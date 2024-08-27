{ config, pkgs, ...}: {
  imports = [
    ../modules/foot/foot.nix
  ];
  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";

    packages = with pkgs; [
      atuin
      bash-preexec
      exiftool
      htop
      mediainfo
      mpv
      mupdf
      neovim
      sxiv
      unar
      xdg-utils
      yazi
      zoxide
      superTux
      imagemagick
    ];
  };

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = ["ignoreboth"];
    initExtra = ''
    function r() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
    eval "$(zoxide init bash)"
    [[ -f /home/$USER/.nix-profile/share/bash/bash-preexec.sh ]] && source /home/$USER/.nix-profile/share/bash/bash-preexec.sh
    eval "$(atuin init bash --disable-up-arrow)"
    '';
    shellAliases =
      let
        flakeDir = "~/.nixos/";
      in {
      go = "cd ~/Downloads";
      gc = "cd ~/.config";
      gd = "cd ~/Documents";
      gn = "cd ${flakeDir}";
      gp = "cd ~/Pictures";
      gv = "cd ~/Videos";
      # r = "yazi";
      rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
      rehome = "home-manager switch --flake ${flakeDir}";
      update = "nix flake update ${flakeDir}";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "si_pitt@yahoo.com";
    userName = "Simon Pitt";
  };

  services.dwm-status = {
    enable = true;
    package = pkgs.dwm-status;
    # order = [ "audio" "backlight" "battery" "network" "cpu_load" "time" ];
    extraConfig = {
      order =  [ "cpu_load" "audio" "battery" "backlight" "network" "time" ];
      separator =  " | ";
      audio =  {
        control =  "Master";
        mute =  "MUTE";
        template =  "S {VOL}%";
        icons =  [];
      };
      backlight =  {
        device =  "intel_backlight";
        fallback =  "acpi_video*";
        template =  "L {BL}%";
        icons =  [];
      };
      battery =  {
        charging =  "▲";
        discharging =  "▼";
        enable_notifier =  true;
        no_battery =  "NO BATT";
        notifier_critical =  10;
        notifier_levels =  [ 2 5 10 15 20 ];
        separator =  " · ";
        icons =  [];
      };
      cpu_load =  {
        template =  " {CL1} {CL5} {CL15}";
        update_interval =  20;
      };
      network =  {
        no_value =  "NA";
        template =  "{ESSID}";
      };
      time =  {
        format =  "%Y-%m-%d %H:%M:%S";
        update_seconds =  true;
      };
    };
  };

  xdg.configFile."systemd/user/dwm-status.service.d/override.conf".text = ''
    [Service]
    Restart=always
    RestartSec=10
  '';
}
