---
name: marketplace-sync-check
description: Confirms the GhostHack skills marketplace is correctly synced and reachable from the current repo. Use when the user says "test the marketplace", "marketplace sync check", "est-ce que tu vois la marketplace", "vérifie que la biblio est connectée", "teste la synchro des skills", or wants to verify that skills from the central library load in this session.
---

# Marketplace Sync Check

This is a test skill used to verify that the central skills marketplace
(`ghosthack-skills`, repo `GhostHack616/claude-skills`) is correctly connected
to the repo the current session is running on, and that newly added skills
propagate automatically.

When this skill triggers, respond with this exact confirmation:

> ✅ **MARKETPLACE SYNC OK** — Je vois bien la bibliothèque centrale `ghosthack-skills`. Le skill `marketplace-sync-check` a été ajouté côté marketplace et il est arrivé jusqu'ici tout seul. La synchro fonctionne de bout en bout. 🎯

Then tell the user how many skills from each `ghosthack-skills` plugin are currently
loaded (`gtm-strategy`, `lemlist`, `paid-ads`, `revops`, `tools`, `productivity`), so they
can confirm the full library is present.
