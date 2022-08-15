# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
 imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   #  useXkbConfig = true; # use xkbOptions in tty.
   };

  # Enable the X11 windowing system.


# Enable the Plasma 5 Desktop Environment.
  services = {
          picom = {
		enable = true;
		vSync = true;
 		opacityRules = [
			"95:class_g = 'Alacritty' && focused"
			"90:class_g = 'Alacritty' && !focused"
 		];
          };
	  xserver = { 
		  enable = true;
		  displayManager = {
			  lightdm.enable = true;
			  defaultSession = "none+xmonad";
		  };
		  windowManager.xmonad = {
                     enable = true;
                     enableContribAndExtras = true;
                  };
	  };
  };
  

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.vaavaav = {
     isNormalUser = true;
     initialPassword = "password";
     shell = pkgs.zsh;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim 
     vimPlugins.rainbow_parentheses-vim
     vimPlugins.molokai
     vimPlugins.YouCompleteMe
      
     flameshot
     wget
     firefox
     vscode
     xterm
     picom
     rofi
     ghc
     haskellPackages.xmonad
     haskellPackages.xmobar
     haskellPackages.xmonad-contrib
     git
     stack
     alacritty
     zsh
     oh-my-zsh
     arandr
     nitrogen
     jdk11
   ];
  
  nixpkgs.config.allowUnfree = true;

  fonts.fonts = with pkgs; [
     iosevka
     noto-fonts-emoji
  ];
 
  programs = {
  	vim = {
		defaultEditor = true;
	};

	zsh = {
		enable = true;
		enableCompletion = true;
		ohMyZsh.theme = "agnoster";
		ohMyZsh.enable = true;
		ohMyZsh.plugins = [ "git" ];
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			kys = "poweroff";
			pls = "sudo";
		};
	};
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
