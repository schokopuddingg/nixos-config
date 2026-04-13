{ pkgs, ... }:
{

  home.packages = with pkgs; [

    signal-desktop
    whatsapp-electron
    gajim
    ferdium
    element-desktop
    telegram-desktop
    discord
    thunderbird
    tuba

  ];
}
