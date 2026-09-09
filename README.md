# kylemclaren/homebrew-tap

Personal Homebrew tap for Kyle McLaren's apps and command-line tools.

## Install

```
brew tap kylemclaren/tap
brew install --cask container-ui
```

Or in one step:

```
brew install --cask kylemclaren/tap/container-ui
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

## Gatekeeper note

`container-ui` is currently unsigned and un-notarized, so macOS blocks it on
first launch. Homebrew intentionally no longer bypasses Gatekeeper (the
`--no-quarantine` flag was removed in Homebrew 5.1). After installing, run:

```
xattr -dr com.apple.quarantine /Applications/ContainerUI.app
```

`brew install --cask container-ui` prints this same instruction as a caveat.

## Updating the cask for a new release

1. Bump `version` in `Casks/container-ui.rb`.
2. Copy the `ContainerUI-<version>.dmg` hash from that release's `SHA256SUMS.txt` into `sha256`.
3. `brew audit --cask --online container-ui` and `brew style --fix Casks/container-ui.rb`.
