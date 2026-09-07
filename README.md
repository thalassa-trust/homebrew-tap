# homebrew-tap

A [Homebrew](https://brew.sh) tap for [BusKill](https://www.buskill.in/) on
macOS.

BusKill is a laptop kill cord: a magnetic USB cable that locks, shuts down, or
runs a custom trigger on your machine when it is physically separated from you.

`AGENTS.md`, `docs/VOICE.md` and `docs/CODING-STANDARD.md` bind every change.

## Install

```sh
brew tap thalassa-trust/tap
brew install --cask buskill
```

Upstream ships an ad-hoc signed build: no Apple Developer ID and no
notarization ticket. On macOS 15 and later, Gatekeeper blocks the first Finder
launch with "Apple could not verify ... is free of malware". Stripping
`com.apple.quarantine` does not help. The notarization check no longer depends
on that flag, and Homebrew removed `--no-quarantine` in 5.x.

To approve it: dismiss the dialog with **Done** (not Move to Trash), then open
**System Settings > Privacy & Security** and click **Open Anyway** for the
installed `buskill-v*.app`.

The bundled CLI is not affected and works immediately.

## Usage

The cask installs both the GUI app and a `buskill` CLI on `PATH`:

```sh
buskill --help
buskill --list-triggers
buskill -a                 # arm
```

## Apple Silicon

The upstream release is a thin x86_64 binary. It runs on Apple Silicon under
Rosetta 2:

```sh
softwareupdate --install-rosetta --agree-to-license
```

## Upgrade / uninstall

```sh
brew upgrade --cask buskill
brew uninstall --cask buskill
brew uninstall --zap --cask buskill   # also removes the .buskill config dir
```

Do not use the app's own `-U/--upgrade` self-updater. It drops a second copy
outside Homebrew's control.

## Notes

- macOS only. Upstream also publishes Linux and Windows builds; they are out of
  scope for this tap.
- The `.app` bundle name includes the version, and BusKill keeps its config in
  `.buskill/` next to the app bundle rather than in `~/Library`. The cask's
  `zap` stanza cleans up the usual locations.
- The `sha256` is copied from upstream's signed `SHA256SUMS`.

## Upstream

- App: <https://github.com/BusKill/buskill-app>
- Docs: <https://docs.buskill.in>
- License: GPL-3.0 (the app; this tap's packaging is MIT)
