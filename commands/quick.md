---
description: Create a minimal handoff - just the essentials
---

Create a minimal `HANDOFF.md` with only the essentials. Use this for simple tasks or quick context transfers.

Output this exact format (fill in the brackets):

```markdown
# Handoff: [task in 5 words or less]

**Goal**: [one sentence]

**Done**: [comma-separated list of completed items, or "Nothing yet"]

**Next**: [the single most important next step]

**Watch out**: [one key warning, or "Nothing special"]
```

That's it. No extras.

Save to the consolidated **`handoffs/` directory at the workspace root**, named by feature so concurrent handoffs don't collide: `<workspace-root>/handoffs/<feature-slug>.md`. The workspace root is the top-level session directory (for git worktrees, the parent that holds them — not the worktree checkout, so it survives deletion); create it with `mkdir -p` if missing. The slug is the current git branch with `/`→`-`, or a 2–4 word task slug. If `$ARGUMENTS` is a path/name, use that instead. (Example: `~/Desktop/hacktron/handoffs/fix-github-install-request-plg.md`.)
