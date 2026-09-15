cask "brewui" do
  version "0.4.1"
  sha256 "71f1d99e4db0c40fff102adc0309ea6f9c3c555e913c2afda3df8d0bb561ba8f"

  url "https://github.com/Homebrew/brewui/releases/download/v#{version}/Homebrew-#{version}.zip"
  name "Homebrew UI"
  desc "Official macOS GUI for Homebrew"
  homepage "https://github.com/Homebrew/brewui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Homebrew.app"
end
