class Jevql < Formula
  desc "psql-shaped client that evaluates jev() with TypeSafe against vanilla Postgres"
  homepage "https://github.com/kylemclaren/jevql"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.1.0/jevql_0.1.0_darwin_arm64.tar.gz"
      sha256 "70721f1d0db6159d9f57142c2806c00ac098652331c749d530db6199f7feed4c"
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.1.0/jevql_0.1.0_darwin_amd64.tar.gz"
      sha256 "6617506f96164d93a4079668fc4f92ffd001ac8cff386867dda83e5586264be6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.1.0/jevql_0.1.0_linux_arm64.tar.gz"
      sha256 "1c8dc76f8ebc162dd2d22a2eccaa61c8fac23e96ca4201c7d91e68f6fa4e5677"
    end
    on_intel do
      url "https://github.com/kylemclaren/jevql/releases/download/v0.1.0/jevql_0.1.0_linux_amd64.tar.gz"
      sha256 "4074689cec5925608d5d1f55e5f81fc7a7ce1df4ecdf31a808c3a1ce77fed5a1"
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
