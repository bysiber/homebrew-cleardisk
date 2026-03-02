# Homebrew Tap for ClearDisk

Free, open-source macOS app to find and clean developer caches (Xcode, npm, Homebrew, Docker, pip, Cargo, and more).

## Install

```bash
brew tap bysiber/cleardisk
brew install --cask cleardisk
```

## What is ClearDisk?

Your Mac is hiding 50-500 GB of developer caches. ClearDisk finds them in seconds.

- Scans 28 developer cache paths (Xcode DerivedData, node_modules, CocoaPods, Docker, pip, Cargo, Go, Gradle, and more)
- Menu bar monitor with disk usage alerts
- Risk levels for each cache (Safe / Caution / Risky)
- Files go to Trash, not permanent delete
- Zero network access, zero telemetry, fully open source

**GitHub:** https://github.com/bysiber/cleardisk

## Update

```bash
brew upgrade --cask cleardisk
```

## Uninstall

```bash
brew uninstall --cask cleardisk
```
