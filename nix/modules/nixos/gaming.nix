{ pkgs, ... }:
{
  
  # Enable steam
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [ prismlauncher ];
  
}