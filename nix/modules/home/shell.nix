{ pkgs, ... }:
{

  imports = [
    ./fonts.nix
  ];

  programs.oh-my-posh.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      eval "$(oh-my-posh init fish --config ~/.config/ohmyposh/zen.toml)"
      fastfetch
    '';
  };

  programs.zsh = {
    enable = true;
    history.size = 10000;
    initContent = ''
      fastfetch
    '';
    plugins = [
      {
        name = "nix-zsh-completions";
        src = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
      }
      {
        name = "fast-syntax-highlighting";
        inherit (pkgs.zsh-fast-syntax-highlighting) src;
      }
    ];
  };

  programs.bash = {
    enable = true;
    historyFileSize = 1000000;
    historyIgnore = [ "exit" ];
  };

  programs.zoxide = {
    enable = true;
    options = [
      "--cmd"
      "cd"
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.warn_timeout = "1m";
  };

  programs.starship = {
    enable = true;
    presets = [ "catppuccin-powerline" ];
    settings = {

    };
  };

  programs.atuin = {
    enable = true;
    daemon.enable = true;
    settings = {
      style = "compact";
      serch_mode = "skim";
      stats.common_prefix = [
        "sudo"
        "run0"
        ","
      ];
      auto_sync = true;
      sync.records = true;
    };
  };

  programs.carapace = {
    enable = true;
  };

  home.sessionVariables = {
    CARAPACE_EXCLUDES = "nix-build,nix-channel,nix-instantiate,nix-shell,nix,nixos-rebuild,man";
  };
}
