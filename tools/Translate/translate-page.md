# Translating a documentation page into German

Instructions for the translation agent (Claude subagent or a human translator). Input: one
English page under `doc/`. Output: one German page under `de/doc/`. Read `glossary.de.md`
first; its terms are binding.

## Where the German file goes

- Folder: the English folder translated with `folders.de.json`
  (`doc/getting-started/x.md` → `de/doc/erste-schritte/…`).
- File name: kebab-case ASCII derived from the German title, short and keyword-oriented
  (`ueberblick.md`, `arbeiten-mit-zeiteintraegen.md`). Umlauts: `ä→ae`, `ö→oe`, `ü→ue`,
  `ß→ss`. Only `a-z`, `0-9` and `-`. Release notes keep their name (`2026-10.md`).
- Never end a file name with `index.md` (IIS redirects `*index.html`).

## Front matter

```yaml
---
title: <German title, keyword first, at most 60 characters>
description: "<one German sentence, at most 155 characters; quote it when it contains a colon>"
keywords: [<German keywords, lowercase>]          # only if the English page has keywords
faq: true                                          # copy if present
_noindex: true                                     # copy if present
og_image: …                                        # copy if present
en_page: doc/<exact English path>.md               # always, this links the two languages
---
```

## Body

- Translate the whole body 1:1 in structure: same headings hierarchy, same lists, tables,
  alerts (`> [!NOTE]`, `> [!TIP]`, `> [!WARNING]`, `> [!IMPORTANT]` stay as they are, only
  the text after them is translated), same code blocks.
- Formal address ("Sie"). Clear, short sentences. No marketing tone beyond the source.
- **Unchanged:** code blocks and inline code, TCQL, entity/property/list/action names
  (`APP_Timesheet`, `APP_BeginTime`, `APP_DefaultTimesheetList`), file names, URLs, product
  names (time cockpit, Outlook, Entra ID, IronPython), the string `time cockpit` (lowercase,
  never "Time Cockpit" except at the start of a sentence in running text where the source
  also capitalizes), video placeholders `<div class="tc-video" …>`, HTML snippets, keyboard
  shortcuts (`STRG` instead of `CTRL` is the only change).
- **UI labels** (menu entries, buttons, list and form names, module names) use the German
  product UI as listed in `glossary.de.md`. If a label is not in the glossary, keep the
  English label and add it to `review-log.md`.
- **Links:** copy every link target exactly as in the English source (relative paths,
  `~/doc/...`, anchors). Do not translate or rewrite targets; `relink-de.ps1` resolves them.
  Translate only the link text.
- **Images:** keep the Markdown image, translate the alt text and title, and turn the path
  into the root-absolute English path: `images/x.png` in `doc/getting-started/` becomes
  `/doc/getting-started/images/x.png`. (German screenshots come later; `relink-de.ps1`
  switches to a local file automatically once it exists.)
- Dates and numbers in German notation in running text (`13.5.2025`, `1.000`), but never
  inside code or examples that show application output.
- Do not add content, do not drop sentences, do not "improve" the source. If the source is
  wrong or unclear, translate it faithfully and note the doubt in `review-log.md`.

## After translating

1. Run `.\tools\Translate\relink-de.ps1` and `.\tools\Translate\build-de-toc.ps1`.
2. Build with `.\build.ps1 -SkipMetadata` and check the page under
   `http://localhost:8087/de/doc/<path>.html` (0 warnings, links, images, alerts).
3. Add a line to `tools/Translate/review-log.md`: date, page, open questions.
