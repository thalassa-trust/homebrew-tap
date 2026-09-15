cask "cua-driver" do
  version "0.28.1"
  sha256 "52fdabd1947c9b252d881a257d3169372ed1a2d4ea90cdcce7dd624e8360d133"

  url "https://github.com/trycua/cua/releases/download/cua-driver-rs-v#{version}/cua-driver-rs-#{version}-darwin-universal.tar.gz"
  name "Cua Driver"
  desc "Computer-use driver for Accessibility and screen capture"
  homepage "https://cua.ai/docs/cua-driver"

  livecheck do
    url "https://github.com/trycua/cua/releases"
    regex(%r{/releases/tag/cua-driver-rs-v(\d+\.\d+\.\d+)(?![.\d])}i)
    strategy :page_match
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "cua-driver-rs-#{version}-darwin-universal/CuaDriver.app"
  binary "#{appdir}/CuaDriver.app/Contents/MacOS/cua-driver"

  zap trash: "~/.cua-driver"

  caveats <<~EOS
    Install CuaDriver.app in /Applications so macOS retains Accessibility and
    Screen Recording grants.

    Grant permissions: cua-driver permissions grant
    Disable telemetry: cua-driver telemetry disable
  EOS
end
