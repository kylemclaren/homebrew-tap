class SpriteTunnel < Formula
  desc "Tunnel localhost through a Sprite URL"
  homepage "https://github.com/kylemclaren/sprite-tunnel"
  version "0.1.1"

  on_macos do
    on_intel do
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.1/sprite-tunnel_v0.1.1_darwin_amd64.tar.gz"
      sha256 "cfad30f67ffe8568d9359b27f7534435535c9e99ac1bb5ec4766c9d166c67a35"
    end
    on_arm do
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.1/sprite-tunnel_v0.1.1_darwin_arm64.tar.gz"
      sha256 "644da8404fd4d9db501c2cb8774ee02e2aeb4af33311d4d666ffc7d5bf32dbbc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.1/sprite-tunnel_v0.1.1_linux_amd64.tar.gz"
      sha256 "bcb1f6c210ac22c400f8aeeef5862933ebfb42b107ca89fda17af0c65a40da9c"
    end
    on_arm do
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.1/sprite-tunnel_v0.1.1_linux_arm64.tar.gz"
      sha256 "6957e728fadf7899d04bb77f0082c3e137cfa43b286c69b6c5ca23df27fe8daf"
    end
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "sprite-tunnel"
    if File.exist?("sprite-tunnel-linux-amd64")
      libexec.install "sprite-tunnel-linux-amd64"
    else
      libexec.install_symlink bin/"sprite-tunnel" => "sprite-tunnel-linux-amd64"
    end
  end

  test do
    assert_match "sprite-tunnel v#{version}", shell_output("#{bin}/sprite-tunnel --version")
    assert_predicate libexec/"sprite-tunnel-linux-amd64", :executable?
  end
end
