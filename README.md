# homebrew-tap

A [Homebrew](https://brew.sh) tap for [BusKill](https://www.buskill.in/) on **macOS**.

BusKill is a laptop kill cord: a magnetic USB cable that locks, shuts down, or
runs a custom trigger on your machine when it is physically separated from you.

## Install

```sh
brew tap thalassa-trust/tap
brew install --cask buskill
```

Upstream ships an **ad-hoc signed** build: no Apple Developer ID and no
notarization ticket. On macOS 15 and later, Gatekeeper blocks it the first time
you launch it from Finder with *"Apple could not verify ... is free of malware"*.
Stripping `com.apple.quarantine` does **not** help — the notarization check no
longer depends on that flag, and Homebrew removed the `--no-quarantine` option
entirely in 5.x.

To approve it: dismiss the dialog with **Done** (not *Move to Trash*), then open
**System Settings > Privacy & Security** and click **Open Anyway** for
`buskill-v0.7.0.app`.

The bundled CLI is not affected and works immediately.

## Usage

The cask installs both the GUI app and a `buskill` CLI on your `PATH`:

```sh
buskill --help
buskill --list-triggers
buskill -a                 # arm
```

## Apple Silicon

The upstream release is a **thin x86_64 binary**. It runs on Apple Silicon under
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

Do **not** use the app's own `-U/--upgrade` self-updater — it drops a second
copy outside of Homebrew's control.

## Notes

* macOS only. Upstream also publishes Linux and Windows builds; they are out of
  scope for this tap.
* The `.app` bundle name includes the version (`buskill-v0.7.0.app`), and
  BusKill keeps its config in `.buskill/` **next to** the app bundle rather than
  in `~/Library`. The cask's `zap` stanza cleans up the usual locations.
* Verified against upstream's signed `SHA256SUMS` for `v0.7.0`.

## Upstream

* App: <https://github.com/BusKill/buskill-app>
* Docs: <https://docs.buskill.in>
* License: GPL-3.0 (the app; this tap's packaging is MIT)
