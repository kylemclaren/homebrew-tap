class Jevql < Formula
  desc "psql-shaped client that evaluates jev() with TypeSafe against vanilla Postgres"
  homepage "https://github.com/kylemclaren/jevql"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.3.0/jevql_0.3.0_darwin_arm64.tar.gz"
      sha256 "ec372bbb32aa9b0a195655a2d447f4ab97c4c48d104a6ffb7b23629c27b9fd2c"
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.3.0/jevql_0.3.0_darwin_amd64.tar.gz"
      sha256 "aa8f601353015b983cc90c4e7861bba5dccfd250b9be2945d0db3a240334914a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.3.0/jevql_0.3.0_linux_arm64.tar.gz"
      sha256 "46c7717c16d6a8025965871d4cd44ea4981c1847447cab8bb2808cbf05ed71fc"
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.3.0/jevql_0.3.0_linux_amd64.tar.gz"
      sha256 "a1bd743ddd6132e69d57cd2aa2d526024af2b1d61c891322896763d8ed44d8af"
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
