# homebrew-tap

A Homebrew tap for macOS applications.

| What | Value |
| --- | --- |
| Rules | `AGENTS.md`, `docs/VOICE.md`, `docs/CODING-STANDARD.md` |

## Install

```sh
brew tap thalassa-trust/tap
brew install --cask buskill
brew install --cask cua-driver
brew install --cask kraken-desktop
```

| Cask | Application |
| --- | --- |
| `buskill` | [Laptop kill cord](https://www.buskill.in/) |
| `cua-driver` | [Computer-use driver](https://cua.ai/docs/cua-driver) |
| `kraken-desktop` | [Trading terminal](https://www.kraken.com/desktop) |

## BusKill

Upstream's macOS build is ad-hoc signed. Gatekeeper blocks the first Finder
launch, and removing `com.apple.quarantine` does not bypass that check.

| Step | Action |
| --- | --- |
| 1 | Dismiss the dialog with `Done`, not `Move to Trash` |
| 2 | System Settings > Privacy & Security > `Open Anyway` |
| 3 | Select the installed `buskill-v*.app` |

The CLI is not subject to that block.

```sh
buskill --help
buskill --list-triggers
buskill -a
```

BusKill is x86_64 and requires Rosetta 2 on Apple Silicon.

```sh
softwareupdate --install-rosetta --agree-to-license
```

The app's `-U` updater installs a second copy outside Homebrew. Upgrade it with
Homebrew.

## Cua Driver

CuaDriver.app stays in `/Applications` so macOS retains its Accessibility and
Screen Recording grants.

```sh
cua-driver permissions grant
cua-driver telemetry disable
```

## Upgrade

```sh
brew upgrade --cask buskill
brew upgrade --cask --greedy-auto-updates cua-driver
brew upgrade --cask --greedy-auto-updates kraken-desktop
```

## Remove

```sh
brew uninstall --zap --cask buskill
brew uninstall --zap --cask cua-driver
brew uninstall --zap --cask kraken-desktop
```
