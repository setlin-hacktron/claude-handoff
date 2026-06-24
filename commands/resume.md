---
description: Resume work from a handoff document
---

Resume work from a handoff created by another AI agent.

## 1. Find and Read the Handoff

Handoffs live in a consolidated `handoffs/` directory at the workspace root (the top-level session directory; for git worktrees, the parent that holds them), one file per feature/branch slug.

Look for the handoff document, in order:
- If `$ARGUMENTS` is provided, read that path (or `handoffs/$ARGUMENTS.md`)
- Otherwise, look in `<workspace-root>/handoffs/` for a file matching the current git branch slug (branch with `/`→`-`)
- If no branch match, list the files in `handoffs/` and ask the user which to resume
- Legacy fallback: a `HANDOFF.md` in the current directory
- If nothing is found, ask the user for the path

Read the entire handoff document carefully.

## 2. Verify State Hasn't Drifted

Run `git status` and `git log --oneline -3` to check:
- Is the branch the same as documented?
- Have there been commits since the handoff was created?
- Are there uncommitted changes not mentioned in the handoff?

If state has drifted significantly, warn the user:
> "The repo has changed since this handoff was created. [describe changes]. Should I proceed with the handoff context anyway, or would you like to describe what changed?"

## 3. Summarize to the User

Give a brief summary (not the whole document):

```
Resuming from handoff: [title]

Goal: [1 sentence]
Status: [X of Y tasks complete]
Next: [First item from Resume Instructions]

Ready to continue?
```

## 4. Heed the Warnings

Pay special attention to:
- **Failed Approaches** - Don't repeat these mistakes
- **Warnings** - Respect gotchas from the previous agent
- **Key Decisions** - Follow established patterns unless user asks to change

## 5. Continue the Work

Start with the first item in "Resume Instructions" unless the user redirects.

If the handoff is unclear on something critical, ask the user rather than guessing.
