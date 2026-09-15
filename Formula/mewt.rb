class Mewt < Formula
  desc "Mutation testing framework"
  homepage "https://github.com/trailofbits/mewt"
  url "https://github.com/trailofbits/mewt/releases/download/v4.0.0/mewt-aarch64-apple-darwin.tar.xz"
  version "4.0.0"
  sha256 "e0ee0fb8eadeade3be22c582e1fcc188865e5a26b7889e1ebd9532099a873f6f"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64

  def install
    bin.install "mewt-aarch64-apple-darwin/mewt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mewt --version")
  end
end
