class Jevql < Formula
  desc "psql-shaped client that evaluates jev() with TypeSafe against vanilla Postgres"
  homepage "https://github.com/kylemclaren/jevql"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.2.0/jevql_0.2.0_darwin_arm64.tar.gz"
      sha256 "3f1a555facce3d42f3c87abce15805bab926f6ec5d0826eb8012ab74414ef6d0"
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.2.0/jevql_0.2.0_darwin_amd64.tar.gz"
      sha256 "f47bd00ba977ad59c2963e756933956238bba999b65244efc25fca5698466aa1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.2.0/jevql_0.2.0_linux_arm64.tar.gz"
      sha256 "716434352b62dc0db4376af9ccdf97a0a20d3ebc29ee20d56ce7a1c9fc5d30bb"
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.2.0/jevql_0.2.0_linux_amd64.tar.gz"
      sha256 "8087e28e7c24ca17e80410af0664bd883c7be416ce17c5a5eb20b9a45af5db58"
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
