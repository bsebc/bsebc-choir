# BSEBC Choir

Attendance and song ledger for the church choir. Static site — plain HTML/CSS/JS,
no framework and no build step. Interface in English and Russian (toggle in the
masthead); singer names and song titles always stay in Russian.

## Files

| File          | What it is                                                        |
|---------------|-------------------------------------------------------------------|
| `index.html`  | The whole site in one self-contained file. This is what gets served. |
| `.nojekyll`   | Tells GitHub Pages to serve the files as-is (no Jekyll processing). |
| `404.html`    | Fallback page for unknown URLs.                                    |
| `README.md`   | This file.                                                         |

No images or font files are needed: the church mark is drawn in CSS, and Alice +
Golos Text load from Google Fonts.

## Publishing on GitHub Pages

1. Upload these files to the repository root (**Add file → Upload files**).
2. **Settings → Pages → Build and deployment**
   Source: *Deploy from a branch* · Branch: `main` · Folder: `/ (root)` · **Save**.
3. Wait about a minute. The site is live at
   `https://<your-username>.github.io/<repo-name>/`.

No workflow YAML is required — that is only for sites that need a build step.

## Status

The screens are high-fidelity mockups with sample data. Adding a database
(Supabase) is the next step:

- publish the Supabase URL and **anon** key in the page — never the service_role key
- row-level security: public `select`, writes only for the signed-in director
- tables: `singers`, `songs`, `events`, `absences`, `event_songs`
- only absences are stored, mirroring the paper ledger
