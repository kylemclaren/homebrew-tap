cask "disktree" do
  version "1.0.0"
  sha256 "04a0f2b054610b0cc5ed97f20447e56a5d82237096b915d2f6effc1ddc5bebbd"

  url "https://github.com/kylemclaren/disktree/releases/download/v#{version}/disktree-#{version}-macos-universal.zip"
  name "disktree"
  desc "Treemap of what fills a disk, handing marked paths to Finder or Terminal"
  homepage "https://github.com/kylemclaren/disktree"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "disktree.app"
  # The launcher inside the bundle, not Contents/MacOS/disktree: it follows
  # this link back to the app, where the binary linked directly would start
  # without its bundle (no settings, no privacy grants).
  binary "#{appdir}/disktree.app/Contents/Resources/disktree"

  zap trash: [
    "~/Library/Preferences/io.github.kylemclaren.disktree.plist",
    "~/Library/Saved Application State/io.github.kylemclaren.disktree.savedState",
  ]

  caveats <<~EOS
    disktree is signed ad hoc, not notarized, so Gatekeeper refuses to open it
    on first launch. Homebrew no longer lifts the quarantine for you (the
    --no-quarantine flag was removed in Homebrew 5.1). After installing, run:

      xattr -dr com.apple.quarantine #{appdir}/disktree.app

    To measure the folders macOS keeps private (Mail, Messages, other apps'
    data), give disktree Full Disk Access in System Settings › Privacy &
    Security. It never deletes anything itself.
  EOS
end
