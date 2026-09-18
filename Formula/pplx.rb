class Pplx < Formula
  desc "Perplexity AI CLI"
  homepage "https://github.com/perplexityai/perplexity-cli"
  url "https://github.com/perplexityai/perplexity-cli/releases/download/v0.2.3/pplx-aarch64-apple-darwin.bin"
  sha256 "9af14c21589f6782e2dae0e3f2a4c21be11112f46a7aa499adcf9f9f58d3d5d0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "pplx-aarch64-apple-darwin.bin" => "pplx"
  end

  test do
    assert_match "pplx", shell_output("#{bin}/pplx --version")
  end
end
