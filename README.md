# Homebrew tap for EzReader

[EzReader](https://github.com/alxbdn/EzReader) is a fast, lightweight PDF reader and editor. This tap installs the macOS version (macOS 11 or later, Intel and Apple Silicon).

## Installation

Paste this in the Terminal:

```bash
brew install --cask alxbdn/ezreader/ezreader
```

No Homebrew yet? Install it first, then run the line above:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

EzReader is then in Applications and opens straight away.

## Update and remove

```bash
brew upgrade --cask ezreader              # update
brew uninstall --cask ezreader            # remove
brew uninstall --zap --cask ezreader      # remove, settings included
```

## Notes

The app is signed ad hoc but not notarized by Apple, so the cask removes the quarantine flag after installing it: EzReader opens with no "unidentified developer" warning.

The macOS app is built here, not in the EzReader repository: for each EzReader release, `.github/workflows/macos-release.yml` builds the universal disk image from that tag, publishes it as a release of this tap and points the cask at it. macOS runners on GitHub are often busy, so a dropped build is retried every hour without holding back EzReader's own release.
