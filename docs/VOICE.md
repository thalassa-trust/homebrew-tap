# Voice

Write as the reader: they parse what is written, not what is meant.
Figurative language does not resolve; it stalls.

This governs everything a human reads: docs, comments, commit messages, error
text, issue bodies, code review, and cask caveats. It is also a way of
deciding, not only of writing: see the last section.

This repository has no product UI. The on-screen limits still bind any
reader-facing string that appears. The rest of the document binds always.

**If a file passes this document on a read-through, read it again against the
limits below.** A standard that everything already satisfies is not a standard.

The organization-wide copy is `thalassa-trust/thalassa`'s `docs/VOICE.md`.
Where this file and that differ, this file is the defect, except for the
cask-caveats exception recorded in `AGENTS.md`.

## Hard limits

These are counts, not judgments. Exceed one and the text is wrong.

| Thing | Limit |
| --- | --- |
| Line comment | 1 line, 12 words |
| Doc comment | 1 sentence. A second only for a hazard. |
| Hazard comment | 3 lines. It has earned them; nothing else has. |
| Documentation paragraph | 3 sentences. Then use a table. |
| Commit subject | 8 words |
| Commit body | Only a reason the diff cannot show. |
| Issue body | What failed, what was expected, the consequence. |
| Error | 10 words, and it still names the cause |

**No punctuation that carries no information.** No exclamation, no ellipsis, no
trailing colon on a label.

**Do not explain the obvious. Do state the surprising.**

**Cut every word that is not the fact.** Articles, time qualifiers and
softeners are not facts. `right now`, `yet`, `at the moment` and `currently`
say the state may change. Every state may change.

## Banned outright

**Figurative language.** No: *at a glance, under the hood, drill down, deep
dive, surface (as a verb), unlock, powerful, seamless, robust, rich, smart,
intuitive, clean, elegant, first-class, out of the box, heavy lifting, source
of truth, north star.*

**Purpose verbs.** Say what a thing is, never what it does for the reader. No:
*helps you, lets you, allows you to, enables, makes it easy to, so you can,
designed to, built to.*

**Hedges and filler.** No: *simply, just, essentially, basically, actually,
really, quite, fairly, generally, typically, various, appropriate, as needed,
please note, of course, note that, in order to, it should be noted.*

**Exclamation marks. Questions addressed to the reader. First person plural.**
No *we*, no *our*, no *let's*.

## Register

Professional throughout. Professional means exact and impersonal, not polished
and not padded.

**In prose, write grammatically.** Terseness means no wasted sentence, not
dropped syntax.

- No slang, no jokes, no winking, no emoji, no exclamation.
- No apology and no reassurance.
- Neutral tone under failure. An error is a fact about the system, not an
  event with a mood.

## Comments

Comments state **invariants, reasons and hazards**. Nothing else.

If a comment explains why the code is not the obvious thing, keep it. If it
describes what the next line plainly does, delete it.

**A comment that disagrees with the code is worse than no comment**, because it
is trusted. When you touch a stanza, verify its comment against the body.

Provenance is a comment: anything an outside authority defines carries a link
to that authority.

## Errors

An error names **what failed, what was expected, and what the reader can do**.
No apology, no blame, no cheer.

**Distinct failures get distinct messages.**

## Documentation

Document the **rule and the reason**, never the reading. No counts, dates,
versions, timings or sizes unless that value is itself the thing being pinned.
Name the command that prints the live value instead.

Exception, and only this: a provenance record, a pinned dependency version, a
protocol version, a documented rate limit. Those are facts, not readings.

## Provenance

A claim resting on an outside authority carries a citation to that authority,
not a restatement of it.

## One explanation per cause

A rule, decision or error with one cause gets one explanation. With two causes
it gets two.

## Assertions that can fail

An assertion in prose must be checkable against the thing it describes. Name
what would prove it wrong. If no change would contradict it, it is decoration.

## The same angle, applied to decisions

- **Prefer the explicit over the clever.** A reader should not have to infer.
- **Prefer failing loudly to degrading silently.**
- **Make the illegal state unrepresentable** rather than documenting that it is
  illegal.
- **Measure rather than assert.**
- **Say what you did not do.** An omission stated is information; an omission
  hidden is a defect waiting.
- **A thing that is already correct is not evidence the bar is right.** Raise
  it or find what it missed.
