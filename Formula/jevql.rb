class Jevql < Formula
  desc "psql-shaped client that evaluates jev() with TypeSafe against vanilla Postgres"
  homepage "https://github.com/kylemclaren/jevql"
  url "https://github.com/kylemclaren/jevql/archive/refs/tags/v0.1.0.tar.gz"
  # TODO: replace once the v0.1.0 tag exists (the release workflow rewrites
  # this formula with prebuilt binaries and real checksums).
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  head "https://github.com/kylemclaren/jevql.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/kylemclaren/jevql/internal/app.version=#{version}"), "./cmd/jevql"
  end

  test do
    assert_match "jevql #{version}", shell_output("#{bin}/jevql --version")
  end
end
