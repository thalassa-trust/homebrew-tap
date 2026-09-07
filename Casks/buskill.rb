cask "buskill" do
  version "0.7.0"
  sha256 "3d37067496dad3893c02d1a40cb606026ab2684e8cdc908f28c746cbfcf271f0"

  url "https://github.com/BusKill/buskill-app/releases/download/v#{version}/buskill-mac-v#{version}-x86_64.dmg"
  name "BusKill"
  desc "Laptop kill cord that triggers a lockdown when unplugged"
  homepage "https://www.buskill.in/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

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
      Upstream is ad-hoc signed: no Developer ID, no notarization. Gatekeeper
      blocks the first Finder launch ("Apple could not verify ... is free of
      malware"). Stripping com.apple.quarantine does not change that.

      Dismiss with Done, then System Settings > Privacy & Security > Open
      Anyway for buskill-v#{version}.app.

      The CLI is not subject to that block: buskill --help

      Config is next to the app: #{appdir}/.buskill/config.ini

      Do not use -U/--upgrade. It installs a second copy. Use
      `brew upgrade --cask buskill`.
    EOS
  end
end
