{pkgs, ...} : {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh.theme = "agnoster";
    oh-my-zsh.enable = true;
    oh-my-zsh.plugins = [ "git" ];
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    initExtra = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    shellAliases = {
      kys = "poweroff";
      rrb = "systemctl restart --user random-background"; # restart random background
    };
  };
}
