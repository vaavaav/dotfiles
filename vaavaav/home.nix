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

  home.packages = with pkgs; [
    flameshot
    vscode
    picom
    firefox
    rofi
    jdk
    ghc
    stack
    alacritty
    oh-my-zsh
    spotify
    discord
    openvpn
  ];

  nixpkgs.config.allowUnfree = true;

  # Background
  services.random-background = {
    enable = true;
    display = "fill";
    imageDirectory = "%h/.wallpapers";
  };

  programs.home-manager.enable = true;

  nixpkgs.overlays = [
    ( self: super: {
      discord = super.discord.overrideAttrs (
        _: { src = builtins.fetchTarball {
          url = "https://discord.com/api/download?platform=linux&format=tar.gz" ;
        };
      }
      );
    })
  ];

  imports = [
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/alacritty.nix
    ./modules/vim.nix
    ./modules/xmobar.nix
  ];
}
