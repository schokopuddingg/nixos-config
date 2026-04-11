{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };

  environment.systemPackages = with pkgs; [
    bluetuith
  ];
}
