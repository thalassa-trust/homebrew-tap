class Muton < Formula
  desc "Mutation testing framework for TON smart contracts"
  homepage "https://github.com/trailofbits/muton"
  url "https://github.com/trailofbits/muton/releases/download/v3.1.0/muton-aarch64-apple-darwin.tar.xz"
  sha256 "02a65eb0229d2ab69f655525a2de08494d48d5d55c9e9dc89603bb358b55a3ed"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "muton"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/muton --version")
  end
end
