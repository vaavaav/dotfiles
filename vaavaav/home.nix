{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vaavaav";
  home.homeDirectory = "/home/vaavaav";

  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    alacritty
    cmake
    discord
    elixir
    flameshot
    gcc
    ghc
    jdk
    oh-my-zsh
    openvpn
    picom
    polybar
    rofi
    spotify
    stack
    texlive.combined.scheme-full
    vscode
    xournalpp
    zotero
    rustc
    cargo
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      matklad.rust-analyzer
    ];
  };

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
    ./modules/alacritty.nix
    ./modules/git.nix
    ./modules/polybar.nix
    ./modules/vim.nix
    ./modules/zsh.nix
  ];
}
