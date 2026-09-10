cask "container-ui" do
  version "0.6.1"
  sha256 "e40347855dfd410f8515f5682cfd4fa3fc3990ac44e2b19e5439fe5925852ca8"

  url "https://github.com/kylemclaren/container-ui/releases/download/v#{version}/ContainerUI-#{version}.dmg",
      verified: "github.com/kylemclaren/container-ui/"
  name "ContainerUI"
  desc "Native GUI for Apple's container tool"
  homepage "https://github.com/kylemclaren/container-ui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "ContainerUI.app"

  zap trash: "~/Library/Preferences/dev.kylemclaren.ContainerUI.plist"

  caveats do
    <<~EOS
      ContainerUI is not yet code-signed or notarized, so Gatekeeper will
      refuse to open it on first launch (reporting it as "damaged" or from an
      "unidentified developer"). Homebrew no longer bypasses Gatekeeper for you
      (the --no-quarantine flag was removed in Homebrew 5.1). After installing,
      clear the quarantine attribute yourself:

        xattr -dr com.apple.quarantine #{appdir}/ContainerUI.app

      ContainerUI's UI runs on macOS 14+, but its container backend requires
      macOS 26 on Apple silicon. On older macOS or Intel Macs the app launches
      but backend features will not work.
    EOS
  end
end
