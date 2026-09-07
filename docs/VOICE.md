# Voice

This file is `thalassa-trust/thalassa`'s `docs/VOICE.md`, copied. A difference
from that file, other than the preface below, is a defect.

## This repository

A Homebrew tap. There is no product UI. § What this product is describes the
organisation's investment workspace, not this tree. The on-screen limits still
bind reader-facing strings here. `AGENTS.md` records the one exception: the
Gatekeeper `caveats` stanza, which names the dialog, the settings path, and
the bundle, and cannot lose a step.

The original follows.

Write as the reader: a quant who models professionally, with a strong maths,
computer science and finance background, and who reads **literally**. They parse
what is written, not what is meant. Figurative language does not resolve; it
stalls.

This governs everything a human reads — UI copy, labels, docs, comments, commit
messages, error text, issue bodies, code review. It is also a way of deciding,
not only of writing: see the last section.

**If a file passes this document on a read-through, read it again against the
limits below.** A standard that everything already satisfies is not a standard.

## What this product is

An investment workspace. That is the whole description, and it is what
product-level copy says.

- **Never enumerate features in product-level copy.** Not in page metadata, not
  in a title, not in a description. Today's surfaces are market data, funding
  rates and arbitrage; tomorrow's are not, and a feature list has to be
  rewritten every time the product grows. The name and the category are stable;
  the list is not.
- **Do not scope wording to funding-arb.** It is the sharpest surface today,
  not the product. A label that only makes sense on that page is wrong
  everywhere else.
- **Do not describe the app as read-only or as a viewer.** Execution is not
  ruled out, and copy that forecloses it will have to be unwritten.
- **The register is a professional terminal**, of the kind priced per seat and
  used all day: dense, abbreviated, unadorned. Not a consumer dashboard, and
  never advertising copy. No tagline, no value proposition, no adjectives about
  itself. The product does not describe itself to the reader; it shows them
  numbers.

## Hard limits

These are counts, not judgments. Exceed one and the text is wrong.

| Thing                          | Limit                                    |
| ------------------------------ | ---------------------------------------- |
| Column header                  | 1 word. 2 where one is ambiguous.        |
| Button, tab, nav item, tag     | 2 words                                  |
| Field label                    | 2 words                                  |
| Empty state                    | 3 words                                  |
| Error state                    | 10 words, and it still names the cause   |
| Caption under a table or chart | 10 words                                 |
| Page description               | **delete it**                            |
| Any on-screen sentence         | 1 sentence. There is no second sentence. |

**No punctuation that carries no information.** A fragment takes no full stop:
`no history`, not `no history.` Nothing follows it, so the stop marks nothing.
No exclamation, no ellipsis, no trailing colon on a label. Punctuation stays
only where it separates or disambiguates — `+0.0125 %/8h, longs pay shorts`,
`bid 4.2 · ask 4.4`, a decimal point, a unit slash.

**Do not explain the obvious. Do state the surprising.** A reader of this
calibre does not need `unmatched is expected`. They do need `rate is per 8h, not
annualised` — because assuming otherwise is an 8× error, and that error has
happened here.

**Cut every word that is not the fact.** Articles, time qualifiers and
softeners are not facts:

| Wrong                                       | Right                 |
| ------------------------------------------- | --------------------- |
| `no addressable instrument right now.`      | `no instrument`       |
| `nothing pinned yet.`                       | `nothing pinned`      |
| `there are no opportunities at the moment.` | `no opportunities`    |
| `the gateway did not answer in 5s.`         | `gateway timeout, 5s` |

`right now`, `yet`, `at the moment` and `currently` say the state may change.
Every state may change. They are never the fact — unless the timing _is_ the
fact, as in `4m old`, which stays.

A page description is a paragraph explaining what the reader is looking at. The
reader can see what they are looking at. If a fact is load-bearing, it belongs
in the column header, the unit, or a definition the reader can open — not in
prose above the table.

Where a fact does not fit the limit, the fact is wrong for that position. Move
it; do not lengthen the label.

## Banned outright

**Figurative language.** It does not resolve literally. No: _at a glance, under
the hood, drill down, deep dive, surface (as a verb), unlock, powerful, seamless,
robust, rich, smart, intuitive, clean, elegant, first-class, out of the box,
heavy lifting, source of truth, north star._

**Purpose verbs.** Say what a thing is, never what it does for the reader. No:
_helps you, lets you, allows you to, enables, makes it easy to, so you can,
designed to, built to._ `age of newest mark` — not `helps you check freshness`.

**Hedges and filler.** No: _simply, just, essentially, basically, actually,
really, quite, fairly, generally, typically, various, appropriate, as needed,
please note, of course, note that, in order to, it should be noted._

**Evaluative adjectives on a data surface.** _Good, bad, healthy, strong, poor,
significant, notable, interesting, high, low_ — unless a threshold is stated and
the word is defined by it. `> 2σ` is a fact. `significant` is an opinion.

**Exclamation marks. Questions addressed to the reader. First person plural.**
No _we_, no _our_, no _let's_.

## Register

Professional throughout. Professional means exact and impersonal, not polished
and not padded.

**On a data surface, write fragments.** A label, a cell, an empty state and a
tag are not sentences and gain nothing from being sentences. `no instrument`
is right. `there is currently no addressable instrument.` is the same fact,
worse.

**In prose — docs, comments, commit messages, issue bodies — write
grammatically.** Terseness there means no wasted sentence, not dropped syntax.
A comment is read once by someone debugging at speed; it must parse the first
time.

- No slang, no jokes, no winking, no emoji, no exclamation.
- No apology and no reassurance. `sorry, something broke` and `don't worry,
your data is safe` both address feelings instead of facts.
- Address the reader as a peer who knows the domain. Do not explain funding
  rates, basis, or leverage. Do explain a convention specific to this system.
- Neutral tone under failure. An error is a fact about the system, not an
  event with a mood.

The reader is a professional at work with money at stake. Write the way a risk
report is written: exact, unhurried, and free of both padding and attitude.

## Numbers

**Every number carries unit, and every rate carries its period and sign
convention.** No exception, in copy, comments, tests, fixtures or logs.
`+0.0125 %/8h, longs pay shorts` is complete. `0.0125` is not a number, it is a
digit sequence.

**Never render more precision than the source carries.** Trailing digits the
venue did not send are fabricated.

**Absence, zero and error are three states.** Never let one render as another.
This is the most-violated rule in the codebase and the one most likely to cost
money. An unpriced cost is not free. An unknown history is not new. An
unsupported venue is not a crash. A stale reading is not live.

## Comments and documentation obey the same limits

The limits are not a UI rule. They apply to everything a human reads.

| Thing                   | Limit                                            |
| ----------------------- | ------------------------------------------------ |
| Line comment            | 1 line, 12 words                                 |
| Doc comment             | 1 sentence. A second only for a hazard.          |
| Hazard comment          | 3 lines. It has earned them; nothing else has.   |
| Documentation paragraph | 3 sentences. Then use a table.                   |
| Commit subject          | 8 words                                          |
| Commit body             | Only a reason the diff cannot show.              |
| Issue body              | What failed, what was expected, the consequence. |

**Grammatical is not a licence to be long.** Prose keeps its syntax; it does not
keep its padding. Three sentences that could be a two-row table are wrong even
though each parses.

**Delete any sentence that would survive being deleted.** Read every comment
and ask what a reader loses if it is gone. If the answer is nothing, it goes.

A reason must be stated, and stated once, in the fewest words that carry it. A
rule with no reason is unenforceable; a reason told twice is padding. Both are
defects.

## Comments

Comments state **invariants, reasons and hazards**. Nothing else.

Bad: `// loop over the venues`
Good: `// per-venue cadence: binance overrides the 8h default per symbol`

If a comment explains why the code is not the obvious thing, keep it. If it
describes what the next line plainly does, delete it. If it restates the
signature, delete it.

**A comment that disagrees with the code is worse than no comment**, because it
is trusted. Two have been found here: a wire comment saying
`min(long, short)` where the code computed `l*s/(l+s)`, and a rate-budget doc
citing the wrong weight tier. When you touch a function, verify its comment
against the body.

Provenance is a comment: anything an outside authority defines carries a `///`
link to that authority.

## Errors

An error names **what failed, what was expected, and what the reader can do**.
No apology, no blame, no cheer.

Bad: `Oops! Something went wrong.`
Good: `gateway did not answer in 5s. showing last reading, 4m old`

**Distinct failures get distinct messages.** A handler that returns one message
for a timeout, a bad request and an unsupported venue has destroyed the
information the reader needs.

## Documentation

Document the **rule and the reason**, never the reading. No counts, dates,
versions, timings or sizes unless that value is itself the thing being pinned —
a stale number reads as current and misleads in a way that omitting it does not.
Name the command that prints the live value instead.

A dated observation (`confirmed live 2026-08-30: 2 of 549 listings were absent`)
is a reading. The rule it demonstrates (`absent means not quoted`) is the thing
worth keeping. Keep the rule, cut the reading.

Exception, and only this: a provenance record, an ADR's decision record, a
pinned dependency version, a protocol version, a documented rate limit, a wire
constant. Those are facts, not readings. A provenance record is
`finance/docs/conformance/<venue>.md` or a crate's `SOURCES.md`, where the
capture is the subject: its date, its URL and the value read on that date are
the claim, and they stay.

The exemption belongs to the record, never to the directory it sits in. A
crate's `README.md` is not a provenance record and takes none: it tells a
reader deciding whether to depend on the crate what is true now, so a venue
count, a coverage figure or a dependency version misleads there exactly as it
does at the root (finance#993).

## Provenance

A claim resting on an outside authority carries a citation to that authority,
not a restatement of it. Derived from the engineering rule that anything an
outside authority defines carries a link to that authority.

Without the source the claim is unsupported and the reader cannot check it.
`etherscan rate limit: 5/sec` with no link is indistinguishable from invention.

Test: remove the source. If the claim still reads as established, the link was
not carrying its weight.

## One explanation per cause

A rule, decision or error with one cause gets one explanation. With two causes
it gets two. Derived from the rule that distinct failures get distinct
messages.

One explanation covering two causes leaves the reader unable to tell which
applies. A single message for a timeout and an unsupported venue is the same
defect in prose as in an error handler.

Test: swap the explanation between two rules, decisions or errors. If the text
still reads correctly, it was not explaining either.

## Assertions that can fail

An assertion in prose must be checkable against the thing it describes.
Derived from the rule that a test surviving mutation is not a test.

`the handler returns errors` is satisfied by every implementation, so it states
nothing. `the handler returns Err on timeout, on bad request, and on
unsupported venue` is contradicted by muting any branch. The first cannot fail
and is therefore not a rule. Prose is not exempt from the standard applied to
tests.

Test: name what would prove the assertion wrong. If no change to the system
would contradict it, it is decoration.

## The same angle, applied to decisions

The voice is a stance, not a style. It applies wherever there is a choice:

- **Prefer the explicit over the clever.** A reader should not have to infer.
- **Prefer failing loudly to degrading silently.** A silent wrong number is
  worse than a visible gap. Every expensive bug here has been silent.
- **Make the illegal state unrepresentable** rather than documenting that it is
  illegal. A type that cannot hold the wrong thing beats a comment saying not
  to. `Option` beats a defaulted zero. A generated table beats a convention.
- **Measure rather than assert.** "Faster" without two numbers is an opinion.
- **Say what you did not do.** An omission stated is information; an omission
  hidden is a defect waiting.
- **A thing that is already correct is not evidence the bar is right.** It is
  evidence the bar is low. Raise it or find what it missed.
