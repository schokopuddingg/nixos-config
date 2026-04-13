{
  nix.gc.automatic = true;
  nix.settings.auto-optimise-store = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 7d";
}
