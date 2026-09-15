cask "kraken-desktop" do
  version "1.29.1,7dc7c9f941f6b88aa23bbb042f0bd93a8dd6df0e"
  sha256 "b9af8af42208ace62634525326124a271d57b4cd32075cd1c62db33e8e46b154"

  url "https://desktop-downloads.kraken.com/#{version.csv.second}/kraken-universal-apple-darwin.zip"
  name "Kraken Desktop"
  desc "Trading terminal for Kraken spot and margin markets"
  homepage "https://www.kraken.com/desktop"

  livecheck do
    url "https://desktop-downloads.kraken.com/latest.json"
    strategy :json do |json|
      "#{json["version"]},#{json["revision"]}"
    end
  end

  auto_updates true
  depends_on :macos

  pkg "Kraken Desktop.pkg"

  uninstall pkgutil: "com.kraken.desktop"

  zap trash: "~/Library/Containers/com.kraken.desktop"
end
