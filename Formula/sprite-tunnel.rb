class SpriteTunnel < Formula
  desc "Tunnel localhost through a Sprite URL"
  homepage "https://github.com/kylemclaren/sprite-tunnel"
  version "0.1.0"

  on_macos do
    resource "linux-relay" do
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.0/sprite-tunnel_v0.1.0_linux_amd64.tar.gz"
      sha256 "47efb6260037caea48c3e6666051d2b7589b2e3f491de2f4eb45ece81084abd7"
    end

    on_intel do
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.0/sprite-tunnel_v0.1.0_darwin_amd64.tar.gz"
      sha256 "faf9e0794910de0a108f5b4b4183b39d4eae63fb0cad330104ec81d3cd4af0fe"
    end
    on_arm do
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.0/sprite-tunnel_v0.1.0_darwin_arm64.tar.gz"
      sha256 "ac064436a4044c59fbb74df465733d1eacc56a68e016ae35ee45156ffd1d1ed1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.0/sprite-tunnel_v0.1.0_linux_amd64.tar.gz"
      sha256 "47efb6260037caea48c3e6666051d2b7589b2e3f491de2f4eb45ece81084abd7"
    end
    on_arm do
      resource "linux-relay" do
        url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.0/sprite-tunnel_v0.1.0_linux_amd64.tar.gz"
        sha256 "47efb6260037caea48c3e6666051d2b7589b2e3f491de2f4eb45ece81084abd7"
      end
      url "https://github.com/kylemclaren/sprite-tunnel/releases/download/v0.1.0/sprite-tunnel_v0.1.0_linux_arm64.tar.gz"
      sha256 "b792cdad4003fe4c076e4ae444c6d822a2db7c922be41ba46267c0dff2b2035e"
    end
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end


  def install
    bin.install "sprite-tunnel"
    if OS.linux? && Hardware::CPU.intel?
      libexec.install_symlink bin/"sprite-tunnel" => "sprite-tunnel-linux-amd64"
    else
      resource("linux-relay").stage do
        libexec.install "sprite-tunnel" => "sprite-tunnel-linux-amd64"
      end
    end
  end

  def caveats
    <<~EOS
      A Linux relay binary is bundled for installation onto a Sprite:
        sprite-tunnel install --sprite NAME --binary #{opt_libexec}/sprite-tunnel-linux-amd64

      Authenticate installation with SPRITES_TOKEN or --api-token-file.
    EOS
  end

  test do
    assert_match "sprite-tunnel v#{version}", shell_output("#{bin}/sprite-tunnel --version")
    assert_predicate libexec/"sprite-tunnel-linux-amd64", :executable?
  end
end
