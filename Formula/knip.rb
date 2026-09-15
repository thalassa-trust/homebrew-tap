class Knip < Formula
  desc "Find unused files, dependencies, and exports in JavaScript and TypeScript projects"
  homepage "https://knip.dev"
  url "https://registry.npmjs.org/knip/-/knip-6.35.1.tgz"
  version "6.35.1"
  sha256 "7fdd9e7b874debb9a8673bfbdc24e3bd7bd3074318590346524b1ae9ea9c9e14"
  license "ISC"

  livecheck do
    url :stable
    strategy :npm
  end

  depends_on "node"
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knip --version")
  end
end
