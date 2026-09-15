class Blacksmith < Formula
  desc "Blacksmith CI runner CLI"
  homepage "https://blacksmith.sh"
  url "https://clireleases.blacksmith.sh/cli/v0.4.58/darwin/arm64/blacksmith"
  version "0.4.58"
  sha256 "2384984fa9cdb943e9352b4ff6a4adf9e9ac61c194c255887413357fada27d88"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "blacksmith"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blacksmith --version")
  end
end
