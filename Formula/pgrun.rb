class Pgrun < Formula
  desc "Create, use, and delete disposable PGRun Postgres branches"
  homepage "https://pgrun.dev"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/pgrundev/pgrun-cli/releases/download/v#{version}/pgrun_#{version}_darwin_arm64.tar.gz"
      sha256 "9b18dae3172f6a09306d35fe518f1b0788573627229c5888f23ce02b4f15a34c"
    end
    on_intel do
      url "https://github.com/pgrundev/pgrun-cli/releases/download/v#{version}/pgrun_#{version}_darwin_amd64.tar.gz"
      sha256 "d0886bfd5473bac9f869a7c013cecde56fc4b9e413d05af560a747a92a3e2972"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pgrundev/pgrun-cli/releases/download/v#{version}/pgrun_#{version}_linux_arm64.tar.gz"
      sha256 "d81da2541876e2faf42d778f7bcfaee5198cb98bdf181d7d35b8d8fc3a75c1bb"
    end
    on_intel do
      url "https://github.com/pgrundev/pgrun-cli/releases/download/v#{version}/pgrun_#{version}_linux_amd64.tar.gz"
      sha256 "05a08bdeb98f934c0f0831abc1fa466655444cdd20097ed8f9c38e33e75a9713"
    end
  end

  def install
    bin.install "pgrun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pgrun version")
  end
end
