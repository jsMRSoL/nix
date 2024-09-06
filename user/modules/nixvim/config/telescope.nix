{
  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        layout_strategy = "horizontal";
        layout_config = {
          horizontal = {
            width = 0.99;
            height = 0.99;
            preview_width = 0.6;
          };
          vertical = {
            width = 0.99;
            height = 0.99;
          };
        };
        path_display = {
          __unkeyed = "smart";
        };
      };
    };
  };
}
