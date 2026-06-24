---
name: handoff
description: Manages context transfer between AI coding sessions. Activates when HANDOFF.md exists, when user mentions handoff/resume, or when ending significant work.
---

# Handoff Detection

## Where handoffs live

A consolidated `handoffs/` directory at the workspace root (the top-level session directory; for git worktrees, the parent directory that holds the worktrees — not the worktree checkout, so handoffs survive deletion). One file per feature, named by the git branch slug (`/`→`-`), so concurrent worktrees each keep their own and never collide on a shared `HANDOFF.md`.

## On Session Start

Check `<workspace-root>/handoffs/` for a file matching the current git branch slug (also honor a legacy `HANDOFF.md` in the working directory). If found:

1. Read it silently
2. Tell the user: "Found a handoff from a previous session: [title]. [1-sentence goal]. Resume from here?"
3. If they agree, follow `/handoff:resume` flow

## Trigger Words

Activate when user says: "handoff", "hand off", "pass this to", "continue later", "pick up where", "transfer context", "save state", "resume", "take over"

## Creating vs Resuming

- User wants to **create**: They're wrapping up or switching agents → use `/handoff:create`
- User wants to **resume**: They're starting fresh with existing handoff → use `/handoff:resume`

## Proactive Suggestions

Consider suggesting a handoff when:
- User says "I need to go" or "let's stop here"
- A significant milestone is reached
- You've been working for a long time with lots of context

Say: "Want me to create a handoff so you (or another agent) can continue later?"

## Commands

| Command | Use When |
|---------|----------|
| `/handoff:create` | Full handoff with all context |
| `/handoff:quick` | Minimal handoff, just essentials |
| `/handoff:resume` | Continue from existing handoff |
