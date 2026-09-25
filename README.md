# kylemclaren/homebrew-tap

Personal Homebrew tap for Kyle McLaren's apps and command-line tools.

## Install

```
brew tap kylemclaren/tap
brew install --cask container-ui
brew install --cask disktree
```

Or in one step:

```
brew install --cask kylemclaren/tap/container-ui
brew install --cask kylemclaren/tap/disktree
```

## Command-line tools

```sh
brew install kylemclaren/tap/sprite-tunnel
```

| Formula | Platforms | Source |
| --- | --- | --- |
| [`sprite-tunnel`](Formula/sprite-tunnel.rb) | macOS and Linux, Intel and ARM | [kylemclaren/sprite-tunnel](https://github.com/kylemclaren/sprite-tunnel) |

Share a local port using your existing Sprite CLI login:

```sh
sprite-tunnel 3000
```

Relay setup is automatic, including the bundled Linux binary. Add `--public` to share with anyone who has the URL, or `--private` to require Sprite authentication.

## Updating sprite-tunnel

1. Update the version and archive URLs in `Formula/sprite-tunnel.rb`.
2. Copy the four platform hashes from the published release's `checksums.txt`.
3. Run `brew install kylemclaren/tap/sprite-tunnel` and `brew test kylemclaren/tap/sprite-tunnel`.
4. Push the formula update; CI verifies real Homebrew installations on macOS and Linux.

## Casks

| Cask | Source |
| --- | --- |
| [`container-ui`](Casks/container-ui.rb) | [kylemclaren/container-ui](https://github.com/kylemclaren/container-ui) |
| [`disktree`](Casks/disktree.rb) | [kylemclaren/disktree](https://github.com/kylemclaren/disktree) |

`disktree` is a treemap of what fills a disk: mark what should go, and it
hands the list to Finder or copies a command for Terminal. It also puts a
`disktree` command on your `PATH` (`disktree ~/src`, `disktree --disk`).

## Gatekeeper note

`container-ui` and `disktree` are not notarized, so macOS blocks them on
first launch. Homebrew intentionally no longer bypasses Gatekeeper (the
`--no-quarantine` flag was removed in Homebrew 5.1). After installing, run:

```
xattr -dr com.apple.quarantine /Applications/ContainerUI.app
xattr -dr com.apple.quarantine /Applications/disktree.app
```

Each cask prints the same instruction as a caveat.

## Updating a cask for a new release

1. Bump `version` in `Casks/container-ui.rb` or `Casks/disktree.rb`.
2. Copy the release's hash into `sha256`: for container-ui, the `ContainerUI-<version>.dmg` line of `SHA256SUMS.txt`; for disktree, `disktree-<version>-macos-universal.zip.sha256`.
3. `brew audit --cask --online <cask>` and `brew style --fix Casks/<cask>.rb`.
