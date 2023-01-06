{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; 
  boot.loader.grub.splashImage = "/boot/grub.png"; # custom background for grub

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "iosevka";
    keyMap = "us";
  };

  services = {
    picom = {
      enable = true;
      vSync = true;
      backend = "glx"; # this backend fixed my screen tearing
      opacityRules = [
        "95:class_g = 'Alacritty' && focused"
        "90:class_g = 'Alacritty' && !focused"
      ];
    };
    xserver = { 
      enable = true;
      layout = "us";
      xkbVariant = "intl"; # international us keyboard with dead keys
      displayManager = {
        lightdm.enable = true;
        lightdm.background = "/etc/lightdm/greeter.png"; # custom background for lightdm
        defaultSession = "none+i3";
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  users.users.vaavaav = {
    isNormalUser = true;
    initialPassword = "password";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  
  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    arandr
    zsh
    i3-gaps
    brightnessctl
    unzip
    neofetch
    nm-tray
    firefox
    noisetorch
  ];

  nixpkgs.config.allowUnfree = true;
  system.autoUpgrade.enable = true; 

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  fonts = {
    fonts = with pkgs; [
      iosevka
      noto-fonts-emoji
      fantasque-sans-mono
      google-fonts
      material-design-icons
    ];
    fontconfig.defaultFonts = {
      monospace = [ "iosevka" ];
    };
  };

  programs = {
    vim.defaultEditor = true; 
    nm-applet.enable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "22.05"; 
}

