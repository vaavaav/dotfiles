{ pkgs, ... }:

{
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
