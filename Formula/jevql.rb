class Jevql < Formula
  desc "psql-shaped client that evaluates jev() with TypeSafe against vanilla Postgres"
  homepage "https://github.com/kylemclaren/jevql"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.4.0/jevql_0.4.0_darwin_arm64.tar.gz"
      sha256 "7c43cbfa8d449d194fa14ce4cbce1aad67f65399f435f5d790b46491eda842ff"
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.4.0/jevql_0.4.0_darwin_amd64.tar.gz"
      sha256 "0d2ffcf9a199a2cc707e861dc8f559af33a1d7c68624d4415cb6ae1c3572db9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.4.0/jevql_0.4.0_linux_arm64.tar.gz"
      sha256 "62bf9cda33dea663c7054ffbb7e31d9cf196e08cf799ba1e9e4bf16f9b518c6c"
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.4.0/jevql_0.4.0_linux_amd64.tar.gz"
      sha256 "d5edc49c23e0ba1064c7f10db6f7975dd671d1d5fff60956f3913bad86dc4f41"
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
