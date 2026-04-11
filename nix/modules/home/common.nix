{ pkgs, ... }:
{
  imports = [
    ./shell.nix
  ];

  home.packages = with pkgs; [

    # Internet
    chromium

    # Social Media / Messaging
    signal-desktop
    whatsapp-electron
    gajim
    ferdium
    element-desktop
    telegram-desktop
    discord
    thunderbird

    # Tools / Office
    bitwarden-desktop
    libreoffice
    naps2
    vscode

    # Media
    spotify
    darktable
    rawtherapee
    gimp
    steam
    mastodon
    ardour
    audacity
    freetube
  ];
}
