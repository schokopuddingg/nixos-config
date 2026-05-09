{ pkgs, ... }:
{
  imports = [
    ./dev/zed.nix
    ./dev/opencode.nix
    ./dev/vscode.nix
  ];

  home.packages = with pkgs; [
    rpi-imager
  ];
}
