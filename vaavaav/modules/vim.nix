{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
    };
    extraConfig = ''
                syntax on 
                colorscheme monokai
                set nocompatible
                " rainbow parentheses
                let g:rainbow_active = 1
    '';
    plugins = [
      pkgs.vimPlugins.YouCompleteMe
      pkgs.vimPlugins.vim-monokai
      pkgs.vimPlugins.rainbow
      pkgs.vimPlugins.markdown-preview-nvim
      pkgs.vimPlugins.nerdtree
    ];
  }; 
}
