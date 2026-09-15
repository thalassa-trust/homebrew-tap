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
brew install beankeeper
brew install blacksmith
brew install knip
brew install mewt
brew install muton
brew install pplx
brew install rustfilt
brew install vencord-installer
```

| Cask | Application |
| --- | --- |
| `buskill` | [Laptop kill cord](https://www.buskill.in/) |
| `cua-driver` | [Computer-use driver](https://cua.ai/docs/cua-driver) |
| `kraken-desktop` | [Trading terminal](https://www.kraken.com/desktop) |

| Formula | Tool |
| --- | --- |
| `beankeeper` | [Double-entry accounting CLI](https://github.com/Govcraft/beankeeper) |
| `blacksmith` | [CI runner CLI](https://blacksmith.sh) |
| `knip` | [Unused export finder](https://knip.dev) |
| `mewt` | [Mutation testing framework](https://github.com/trailofbits/mewt) |
| `muton` | [TON mutation testing](https://github.com/trailofbits/muton) |
| `pplx` | [Perplexity AI CLI](https://github.com/perplexityai/perplexity-cli) |
| `rustfilt` | [Rust symbol demangler](https://github.com/luser/rustfilt) |
| `vencord-installer` | [Vencord installer CLI](https://github.com/Vencord/Installer) |

All formulae require Apple Silicon Macs.

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

## Vencord Installer

`--branch` has no development entry; patch by location.

```sh
vencord-installer --install --location "/Applications/Discord Development.app"
```

## Upgrade

```sh
brew upgrade --cask buskill
brew upgrade --cask --greedy-auto-updates cua-driver
brew upgrade --cask --greedy-auto-updates kraken-desktop
brew upgrade beankeeper mewt muton rustfilt vencord-installer
```

## Remove

```sh
brew uninstall --zap --cask buskill
brew uninstall --zap --cask cua-driver
brew uninstall --zap --cask kraken-desktop
brew uninstall beankeeper mewt muton rustfilt vencord-installer
```
