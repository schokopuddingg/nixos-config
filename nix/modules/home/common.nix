{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Social Media / Messaging
    signal-desktop
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
    chromium

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
