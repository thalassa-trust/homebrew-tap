class Rustfilt < Formula
  desc "Demangle Rust symbols"
  homepage "https://github.com/luser/rustfilt"
  url "https://static.crates.io/crates/rustfilt/rustfilt-0.2.1.crate"
  version "0.2.1"
  sha256 "c8d748b182c8f95224336d20dcc5609598af612581ce60cfb29da4dc8d0091f2"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :crates_io
  end

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "test", shell_output("echo _ZN4testE | #{bin}/rustfilt").strip
  end
end
