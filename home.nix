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


}
