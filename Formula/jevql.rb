class Jevql < Formula
  desc "psql-shaped client that evaluates jev() with TypeSafe against vanilla Postgres"
  homepage "https://github.com/kylemclaren/jevql"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.4.0/jevql_0.4.0_darwin_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.4.0/jevql_0.4.0_darwin_amd64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.4.0/jevql_0.4.0_linux_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.4.0/jevql_0.4.0_linux_amd64.tar.gz"
      sha256 ""
    end
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "jevql"
  end

  test do
    assert_match "jevql #{version}", shell_output("#{bin}/jevql --version")
  end
end
