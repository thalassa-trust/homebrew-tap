# Coding standard

Expert-level, idiomatic, modern code in every language here. Optimize for high
information density.

This is a standard, not a preference: it binds every change, it is enforced, and
it is retrofitted across the tree whenever it changes rather than applied to new
code alone. A change that reaches the right answer by the wrong method is not
finished.

[`AGENTS.md`](../AGENTS.md) states the engineering rules this sits under, and
[`VOICE.md`](VOICE.md) governs everything a human reads. Where this document and
VOICE.md meet — comments — this one is narrower and wins: it permits fewer than
VOICE.md's limits allow. VOICE.md still governs every comment that survives.

The organization-wide copy is `thalassa-trust/thalassa`'s
`docs/CODING-STANDARD.md`. § General and § Comments are that file. Language
sections exist only for languages this tree has files in.

## General

- **Formatting is a tool's job.** `ruff format`, `prettier`/`biome`, `rustfmt`,
  `swift-format` — always applied, never hand-tuned, never debated. Here that
  tool is `brew style` for casks, and the Actions/prose gates for the rest.
- **Lint hard, suppress narrowly.** ruff with a broad ruleset, eslint/biome
  strict, clippy with pedantic lints enabled, SwiftLint strict. Fix findings; a
  suppression is line-scoped and names the specific rule — never file- or
  project-wide.
- **This standard outranks tool defaults.** When a quality tool conflicts with
  it — a lint demanding docstrings, or forbidding short names — configure the
  tool to conform: disable exactly the conflicting rules and keep everything
  else at maximum restrictiveness. Never loosen a tool beyond what the conflict
  requires, and never bend the code to satisfy a misconfigured tool.
- **Parse, don't validate.** Convert untrusted data into rich types once at the
  boundary (pydantic / zod / serde), then trust it everywhere inside. Validation
  scattered through internals is defensive code by another name.
- **Immutability by default.** Rebinding and mutation only where they earn their
  keep — `const` over `let`, new bindings over in-place edits, `mut` only where
  needed.
- **Stdlib first, then blessed dependencies.** A new dependency must beat what
  the standard library plus five dense lines can do.
- **A custom script should not exist.** Reach for a maintained tool, a
  configuration key, or nothing. Scripting is the least reviewed, least tested
  and least portable code in any repository: it has no type checker, its
  failures are silent by default, and it is the one place where a difference
  between BSD and GNU tooling turns a passing gate into one that checked
  nothing. Prefer a tool invoked from a config file over arguments, and a
  config file over a wrapper. Where a script survives, it says in its own text
  why no tool or config could replace it.
- **A dependency is chosen on evidence, not familiarity.** Prefer one that is
  actively maintained, released, tested, widely depended on, and licensed
  compatibly — checked against the registry rather than assumed. Between two
  that clear that bar, take the one that is smaller and closer to the standard
  library. A library that a fifth of the ecosystem already audits is a better
  bet than a hand-rolled equivalent nobody reviews, and a better bet than an
  unmaintained package with a familiar name.
- **Tests follow the same standard.** Dense, typed, no comments; parametrized or
  table-driven over copy-paste; assert behaviour at boundaries, not
  implementation details.
- **Names scale with scope.** Short in small scope (`q`, `df`, `buf`), longer as
  scope grows. Per-language casing conventions, no exceptions.
- **Where density would need a comment, name the binding.** An intermediate with
  a real name carries what the comment would have said, cannot fall out of step
  with the code, and is checked by the compiler. It is the replacement for the
  comment rather than an exception to the density rule.
- **The retrofit rule is global.** Any change to this document is applied across
  the whole codebase, all languages, in the same session. Behaviour must not
  change.
- **A violation you notice is a violation you fix.** Not only in the file you
  came for: in any file you open, and in any line you read on the way past. Fix
  it in the same change. Do not note it for later, do not leave a comment about
  it, and do not file it as an issue for someone else — "next time we touch it"
  is the failure the retrofit rule exists to prevent, and a standard enforced
  only where someone was already working is not enforced. Two limits, and only
  two: stay out of a directory another agent is working in, reporting it instead
  so one of you edits those lines rather than both; and a fix that would change
  behaviour is reported, never applied silently.

## Comments

`docs/VOICE.md` states what a comment may contain and the provenance exception.
`AGENTS.md` states the `reason` requirement. No comments beyond that, except a
line-scoped suppression with its reason.

## The tools that enforce this

The gates live in `.github/workflows/ci.yml` and `.github/workflows/scan.yml`.
Locally, `brew style` is the loop for a cask change.

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

- **No comments**, beyond the provenance exception in `docs/VOICE.md` and a
  line-scoped suppression with its reason.
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
