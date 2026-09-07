# homebrew-tap

A [Homebrew](https://brew.sh) tap for [BusKill](https://www.buskill.in/) on
macOS.

BusKill is a laptop kill cord: a magnetic USB cable that locks, shuts down, or
runs a custom trigger when it is physically separated from you.

| What | Value |
| --- | --- |
| Rules | `AGENTS.md`, `docs/VOICE.md`, `docs/CODING-STANDARD.md` |

## Install

```sh
brew tap thalassa-trust/tap
brew install --cask buskill
```

Upstream's macOS build is ad-hoc signed: no Developer ID, no notarization.
Gatekeeper blocks the first Finder launch. Stripping `com.apple.quarantine`
does not change that. Homebrew has no `--no-quarantine`.

| Step | Action |
| --- | --- |
| 1 | Dismiss the dialog with Done, not Move to Trash |
| 2 | System Settings > Privacy & Security > Open Anyway |
| 3 | The installed `buskill-v*.app` |

The CLI is not subject to that block.

## Usage

```sh
buskill --help
buskill --list-triggers
buskill -a
```

## Apple Silicon

Thin x86_64. Runs under Rosetta 2.

```sh
softwareupdate --install-rosetta --agree-to-license
```

## Upgrade

```sh
brew upgrade --cask buskill
brew uninstall --cask buskill
brew uninstall --zap --cask buskill
```

The app's `-U` updater installs a second copy outside Homebrew.

## Layout

| Fact | Value |
| --- | --- |
| OS | macOS. Linux and Windows builds are out of scope |
| Bundle | name includes the version |
| Config | `.buskill/` next to the app, not `~/Library` |
| Hash | copied from upstream's signed `SHA256SUMS` |

## Upstream

| What | Value |
| --- | --- |
| App | <https://github.com/BusKill/buskill-app> |
| Docs | <https://docs.buskill.in> |
| App licence | GPL-3.0 |
| This tap | MIT |
