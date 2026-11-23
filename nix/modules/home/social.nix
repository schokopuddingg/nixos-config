{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [

    signal-desktop
    whatsapp-electron
    gajim
    element-desktop
    telegram-desktop
    discord
    thunderbird
    nheko
    inputs.sable.packages.${pkgs.stdenv.hostPlatform.system}.sable-desktop

  ];
}
