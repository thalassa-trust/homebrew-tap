class Pgrun < Formula
  desc "Create, use, and delete disposable PGRun Postgres branches"
  homepage "https://pgrun.dev"
  url "https://github.com/pgrundev/pgrun-cli/releases/download/v0.3.0/pgrun_0.3.0_darwin_arm64.tar.gz"
  sha256 "9b18dae3172f6a09306d35fe518f1b0788573627229c5888f23ce02b4f15a34c"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "pgrun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pgrun version")
  end
end
