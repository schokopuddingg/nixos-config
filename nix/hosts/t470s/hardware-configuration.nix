{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/mapper/luks-4b8c3939-b216-4902-b683-18b6c74e791d";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-4b8c3939-b216-4902-b683-18b6c74e791d".device =
    "/dev/disk/by-uuid/4b8c3939-b216-4902-b683-18b6c74e791d";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/5C1A-35B6";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/mapper/luks-54a0fdb6-f55a-4eab-bc9d-87658a5bc7ad"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
