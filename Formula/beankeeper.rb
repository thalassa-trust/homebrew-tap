class Beankeeper < Formula
  desc "Double-entry accounting CLI"
  homepage "https://github.com/Govcraft/beankeeper"
  url "https://github.com/Govcraft/beankeeper/releases/download/beankeeper-cli-v0.8.0/bk-0.8.0-aarch64-apple-darwin.tar.gz"
  version "0.8.0"
  sha256 "2d8a1a42b4814049cd194ad49c32af58c343b5ce5685373c89378e6a2c718157"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^beankeeper-cli-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_release do |json, regex|
      json.map do |release|
        next if release["draft"] || release["prerelease"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "bk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bk --version")
  end
end
