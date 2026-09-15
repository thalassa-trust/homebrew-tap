class Beankeeper < Formula
  desc "Double-entry accounting CLI"
  homepage "https://github.com/Govcraft/beankeeper"
  version "0.8.0"
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

  on_macos do
    on_arm do
      url "https://github.com/Govcraft/beankeeper/releases/download/beankeeper-cli-v0.8.0/bk-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "2d8a1a42b4814049cd194ad49c32af58c343b5ce5685373c89378e6a2c718157"
    end
    on_intel do
      url "https://github.com/Govcraft/beankeeper/releases/download/beankeeper-cli-v0.8.0/bk-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "639c4849941e846e70715f1220c6047e52341fd7b66e25f19b61780d7ac0574f"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "bk-#{version}-aarch64-apple-darwin/bk"
    else
      bin.install "bk-#{version}-x86_64-apple-darwin/bk"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bk --version")
  end
end
