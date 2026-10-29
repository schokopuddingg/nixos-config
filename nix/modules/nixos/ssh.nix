{ config, ...}:
{
programs.ssh = {
  extraConfig = ''
    Host hydrogen
      Hostname 77.90.12.190
      Port 22
      User root
      IdentityFile ~/t580
  '';
};
}
