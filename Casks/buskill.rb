cask "buskill" do
  version "0.7.0"
  sha256 "3d37067496dad3893c02d1a40cb606026ab2684e8cdc908f28c746cbfcf271f0"

  url "https://github.com/BusKill/buskill-app/releases/download/v#{version}/buskill-mac-v#{version}-x86_64.dmg",
      verified: "github.com/BusKill/buskill-app/"
  name "BusKill"
  desc "Laptop kill cord that triggers a lockdown when unplugged"
  homepage "https://www.buskill.in/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  # Bundle name includes the version, so interpolate it.
  app "buskill-v#{version}.app"
  binary "#{appdir}/buskill-v#{version}.app/Contents/MacOS/buskill"

  zap trash: [
    "#{appdir}/.buskill",
    "/Applications/.buskill",
    "~/.buskill",
    "~/Applications/.buskill",
  ]

  caveats do
    requires_rosetta
    <<~EOS
      The upstream BusKill build is ad-hoc signed: no Developer ID and no
      notarization ticket. On macOS 15 and later, Gatekeeper blocks it the first
      time it is launched from Finder ("Apple could not verify ... is free of
      malware"). Stripping the com.apple.quarantine attribute does not help:
      the notarization check no longer depends on that flag.

      To approve it, dismiss that dialog with "Done", then open
        System Settings > Privacy & Security
      and click "Open Anyway" for buskill-v#{version}.app.

      The bundled CLI is not subject to this and works straight away:
        buskill --help

      BusKill stores its config next to the app bundle, e.g.
      #{appdir}/.buskill/config.ini

      Do not use the app's built-in "-U/--upgrade" updater; it installs a second
      copy outside of Homebrew's control. Use `brew upgrade --cask buskill`.
    EOS
  end
end
