{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    gutenprint
    gutenprint-bin
  ];

}
