{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 12.0;
      };
      colors = {
        primary = {
          background = "0x1d1f21";
          foreground = "0xc5c8c6";
        };
        normal = { 
          black =   "0x1c1e26";
          red =     "0xe95678";
          green =   "0x29d398"; 
          yellow =  "0xfac29a";
          blue =    "0x26bbd9";
          magenta = "0xee64ac";
          cyan =    "0x59e1e3";
          white =   "0xcbced0";
        };
        bright = {
          black =   "0x6f6f70";
          red =     "0xe95678";
          green =   "0x29d398";
          yellow =  "0xfac29a";
          blue =    "0x26bbd9";
          magenta = "0xee64ac";
          cyan =    "0x59e1e3";
          white =   "0xe3e6ee";
        };
      };
    };
  };
}
