{
  plugins = {
    better-escape = {
      enable = true;
      settings.mappings = {
        c = {
          f = {
            d = "<Esc>";
          };
        };
        i = {
          f = {
            d = "<Esc>";
          };
        };
        s = {
          f = {
            d = "<Esc>";
          };
        };
        t = {
          f = {
            d = "<Esc>";
          };
        };
        v = {
          f = {
            d = "<Esc>";
          };
        };
      };
    };
    flash = {
      enable = true;
      settings.jump.nohlsearch = true;
    };
    nvim-autopairs.enable = true;
    surround.enable = true;
    undotree.enable = true;
 };

  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
  };
}
