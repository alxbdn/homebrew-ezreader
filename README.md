# Homebrew tap for EzReader

[EzReader](https://github.com/alxbdn/EzReader) is a fast, lightweight PDF reader and editor. This tap installs the macOS version (macOS 11 or later, Intel and Apple Silicon):

```bash
brew install --cask alxbdn/ezreader/ezreader
```

Update with `brew upgrade --cask ezreader`, remove with `brew uninstall --cask ezreader` (add `--zap` to also remove its settings).

The app is signed ad hoc but not notarized by Apple, so the cask removes the quarantine flag after installing it: EzReader opens straight away, with no "unidentified developer" warning.

The cask follows EzReader's releases on its own (see `.github/workflows/update-cask.yml`).
