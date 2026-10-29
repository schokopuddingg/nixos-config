{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "nfs" ];

  fileSystems."/mnt/kunigunde" = {
    device = "10.0.2.100:/data";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "noauto"
      "nfsvers=4"
    ];
  };
}
