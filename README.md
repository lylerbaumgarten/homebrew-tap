# Homebrew tap for BackRight

[BackRight](https://github.com/lylerbaumgarten/backright) is a free, open-source Mac app that nudges you when your posture slips. The webcam is analysed on your Mac; nothing is saved or sent.

```bash
brew tap lylerbaumgarten/tap
brew trust lylerbaumgarten/tap      # Homebrew 7 asks you to trust third-party taps explicitly
brew install --cask backright
```

Upgrade with `brew upgrade --cask backright`, remove with `brew uninstall --cask backright`.

## What this cask does to Gatekeeper (please read)

BackRight is **not notarized by Apple** (that needs a paid developer account). Normally macOS then asks you to confirm the app in System Settings → Privacy & Security → "Open Anyway". When you install through this cask, Homebrew first checks the download's SHA-256 against the value in [`Casks/backright.rb`](Casks/backright.rb), and then the cask removes macOS's "downloaded from the internet" flag from the app, so you won't see that prompt.

If you'd rather keep macOS's check, skip Homebrew and download the `.dmg` from the [GitHub release](https://github.com/lylerbaumgarten/backright/releases/latest). Everything the app does is open source and covered by the project's privacy tests.

The cask is maintained alongside BackRight's releases; the checksums in it always match the files attached to the GitHub release.
