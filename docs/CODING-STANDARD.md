# Coding standard

Expert-level, idiomatic code in every language here. Optimize for high
information density.

This is a standard, not a preference: it binds every change, it is enforced,
and it is retrofitted across the tree whenever it changes rather than applied
to new code alone.

[`AGENTS.md`](../AGENTS.md) states the engineering rules this sits under, and
[`VOICE.md`](VOICE.md) governs everything a human reads. Where this document
and VOICE.md meet, comments, this one is narrower and wins: it permits fewer
than VOICE.md's limits allow. VOICE.md still governs every comment that
survives.

The organization-wide copy is `thalassa-trust/thalassa`'s
`docs/CODING-STANDARD.md`. The language sections below are the ones this
repository has files in. A language that is not here is not used here.

## General

- **Formatting is a tool's job.** Always applied, never hand-tuned, never
  debated.
- **Lint hard, suppress narrowly.** Fix findings; a suppression is
  line-scoped and names the specific rule.
- **This standard outranks tool defaults.** When a quality tool conflicts with
  it, configure the tool to conform: disable exactly the conflicting rules and
  keep everything else at maximum restrictiveness.
- **A custom script should not exist.** Reach for a maintained tool, a
  configuration key, or nothing.
- **A dependency is chosen on evidence, not familiarity.**
- **Names scale with scope.** Per-language casing conventions, no exceptions.
- **Where density would need a comment, name the binding.**
- **The retrofit rule is global.** Any change to this document is applied
  across the whole codebase, all languages, in the same session. Behaviour
  must not change.
- **A violation you notice is a violation you fix.** Not only in the file you
  came for.

## The tools that enforce this

There is no `just` entry point. The gates live in
`.github/workflows/ci.yml` and `.github/workflows/scan.yml`. Locally, `brew
style` is the loop for a cask change.

| Gate | Reads |
| --- | --- |
| `brew style` | every file under `Casks/` |
| `brew audit --cask --online` | the same, plus the live upstream URL |
| install smoke test | the cask as installed on the runner |
| actionlint, pinact, zizmor, ghalint | `.github/workflows/` |
| editorconfig-checker | the whole tree, per `.editorconfig` |
| lychee `--offline` | local paths in `.md` |
| markdownlint-cli2 | `**/*.md` |
| typos | authored text |
| gitleaks | history and the working tree |

`AGENTS.md` § Gates states what a gate must never do to pass.

## Homebrew Ruby

The files under `Casks/` are Homebrew cask DSL, not application Ruby. `brew
style` is both formatter and linter. No RuboCop config is added beside it.

- A `sha256` is copied from upstream's signed `SHA256SUMS` for that version.
- `livecheck` uses the strategy the URL already implies.
- `zap` names every location the app actually writes. Guessing `~/Library` is
  how a leftover config survives uninstall.
- `caveats` is the user-facing hazard. It is not a comment.

## YAML

Workflows are YAML with shell in `run:` blocks. actionlint and ghalint lint
the workflow; the `run:` body is shell, and `.editorconfig` leaves its indent
unset so those linters own it.

Every `uses:` is SHA-pinned. pinact checks the pin and the version comment.

## Markdown

Hard-wrapped by hand. markdownlint does not enforce line length; the wrap is
the author's. lychee resolves local paths only, so a dead external URL is not
a red gate on somebody else's outage.

## JSON5

`.github/renovate.json5` is Renovate's config. `platformCommit: "enabled"` is
load-bearing: the organisation signature ruleset rejects unsigned commits, and
the git CLI would produce them.
