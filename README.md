# kylemclaren/homebrew-tap

Personal Homebrew tap for Kyle McLaren's macOS apps.

## Install

```
brew tap kylemclaren/tap
brew install --cask container-ui
```

Or in one step:

```
brew install --cask kylemclaren/tap/container-ui
```

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
