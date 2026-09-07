# Security

## Reporting a vulnerability

Write to `mail@fiona.sm`. Encrypt a sensitive report to the key published at
<https://fiona.sm/fiona.asc>. That key is live, not a placeholder.

GitHub private vulnerability reporting is on. Use it or the mailbox. Do not
open an issue for a vulnerability. An issue here is public.

Do not include a working exploit, a real credential, or a captured
authenticated response.

## What this system is

A Homebrew tap. It does not build BusKill. It fetches the upstream macOS DMG,
checks it against a pinned `sha256`, and installs the app and CLI.

- No application code, no package manifest, no lockfile.
- No secrets in the tree. The token CI uses is `GITHUB_TOKEN`.
- The cask checksum is the control. A wrong hash is a failed install, not a
  silent substitute.

## Threat model

**A checksum that does not match upstream.** The realistic failure. Controls:
the `sha256` is copied from upstream's signed `SHA256SUMS`; `brew audit
--cask --online` fetches the live URL; changing a hash without that
verification is a defect under `AGENTS.md`.

**An Action pin that moves.** `uses:` entries are SHA-pinned. pinact checks
the pin. Renovate refreshes digests through the API so the commit is signed.

**The upstream build itself.** BusKill ships ad-hoc signed, with no Developer
ID and no notarization ticket. That is upstream's choice, recorded in the
cask caveats. A report that Gatekeeper blocks the app is not a vulnerability
in this tap.

## What is not a vulnerability here

- Gatekeeper blocking the ad-hoc-signed upstream binary
- The thin x86_64 build needing Rosetta on Apple Silicon
- A Linux or Windows BusKill release this tap does not ship
