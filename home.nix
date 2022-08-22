{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vaavaav";
  home.homeDirectory = "/home/vaavaav";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Background
  services.random-background = {
    enable = true;
    display = "fill";
    imageDirectory = "%h/.wallpapers";
  };

  # Vim configuration
  programs.vim = {
	enable = true;
	settings = {
		number = true;
		relativenumber = true;
	};
	extraConfig = ''
		syntax on 
		colorscheme molokai
		set nocompatible
		" slim cursor
		set guicursor=i-ci:ver10-iCursor
                " rainbow parentheses
                let g:rainbow_active = 1
		'';
	plugins = [
          pkgs.vimPlugins.YouCompleteMe
          pkgs.vimPlugins.molokai
          pkgs.vimPlugins.rainbow_parentheses-vim
        ];
      }; 

      programs.alacritty = {
        enable = true;
        settings = {
          font = {
            size = 12.0;
            normal = {
              family = "iosevka";
              style = "Medium";
            };
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
