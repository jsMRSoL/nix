{
  programs.git = {
    enable = true;
    extraConfig = {
      pull.rebase = true;
      rebase.autostash = true;
    };
    userEmail = "si_pitt@yahoo.com";
    userName = "Simon Pitt";
  };
}
