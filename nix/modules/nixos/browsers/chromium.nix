{
  programs.chromium = {
    enable = true;
    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      "hjdoplcnndgiblooccencgcggcoihigg" # Terms of Service; Didn’t Read
      "gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
      "hlofigcdgjlnalbkeeinfcjceabpamci" # The Great Suspender
      "ojfebgpkimhlhcblbalbfjblapadhbol" # EditThisCookie
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "fploionmjgeclbkemipmkogoaohcdbig" # Page load time
      "fhnegjjodccfaliddboelcleikbmapik" # Tab Counter
    ];
    extraOpts = {
      "BrowserSignin" = "0";
      "SyncDisabled" = "true";
      "PasswordManagerEnabled" = "false";
      "BuiltInDnsClientEnabled" = "false";
      "​DeviceMetricsReportingEnabled" = "true";
      "​ReportDeviceCrashReportInfo" = "true";
      "​SpellcheckEnabled" = "true";
      "​SpellcheckLanguage" = [
        "de"
        "en-US"
      ];
      "​CloudPrintSubmitEnabled" = "false";
    };
  };
}
