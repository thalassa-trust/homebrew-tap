# homebrew-tap

A Homebrew tap. It ships macOS casks.

## The three documents that bind every change

`AGENTS.md` is the engineering standard. `docs/CODING-STANDARD.md` is how code
is written. `docs/VOICE.md` governs everything a human reads, comments
included, and is a stance on decisions rather than only on wording.

All three are imported below, so they are in context from the first turn rather
than being documents to reach for when unsure. None is optional, and none is a
review applied after the work.

@AGENTS.md
@docs/CODING-STANDARD.md
@docs/VOICE.md

## Where reasoning goes

Work here is measured and argued, and that argument has to land somewhere. A
source file is the wrong somewhere. What stays in the code is the one line a
reader debugging at speed cannot reconstruct.

## Before you commit

Re-read the diff against the two documents above. Delete every comment that
survives its own deletion, and verify each surviving one against the body it
describes.

State in your report the comment lines you added and why each block over one
line earned it. An ungraded rule is an ignored rule.
