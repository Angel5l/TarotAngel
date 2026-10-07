# TarotAngel Security Checklist

**Last checked:** 2026-09-27

Answers are based on the current workspace, tracked files and history, and the
publicly visible GitHub repository. **No** means the check is not met or has not
been verified; evidence says which applies.

## Secrets and credentials

| # | Check | Yes / No / N/A | Evidence |
| --- | --- | --- | --- |
| 1 | No API key, token or password is hardcoded in `lib/`, including in comments and commented-out code | YES | Searched `lib/` for credential names and common key patterns; found no credential values. |
| 2 | Anything private is in a gitignored config or passed with `--dart-define`, with an example file committed | N/A | The app has no private runtime configuration; `.env` is ignored and `.env.example` contains placeholders only. |
| 3 | No keystore, `key.properties` or signing credential is in the repository | YES | No signing files are tracked, and no signing credentials appeared in the repository file search. |
| 4 | Git history is clean: I searched `git log -p` for password, secret, api key and token | YES | Searched all local history with `git log -p --all`; matches were documentation, placeholders, and workflow comments, not credential values. |
| 5 | Any credential that was ever committed has been rotated | N/A | No committed credential was found in the reviewed history, so none was identified for rotation. |

## GitHub Actions

If your project has no workflows, mark every row N/A and say so once.

| # | Check | Yes / No / N/A | Evidence |
| --- | --- | --- | --- |
| 6 | No secret value is written literally in any workflow YAML file | YES | Inspected `.github/workflows/deploy-web.yml`; it contains no literal credential values. |
| 7 | Secrets are stored in repository Actions secrets and read with `${{ secrets.NAME }}` | N/A | The app needs no Actions secrets; the workflow's sample secret references are commented out. |
| 8 | No workflow step echoes, dumps or debug-prints a secret, and I opened a recent run's log to confirm | NO | The workflow has no active secret injection or dump step, but a recent Actions run log was not inspected. |
| 9 | If I build a signed APK: the keystore is a base64 secret decoded to a file at build time, never printed | N/A | This workflow builds and deploys a web app; it does not build a signed APK. |
| 10 | Uploaded build artifacts contain no key file, keystore or generated config | YES | The workflow uploads only `build/web`; no credential config or signing files are used by the app. |
| 11 | Third-party actions are pinned to a commit SHA, not a moveable tag | NO | The workflow references actions by version tags (`@v7`, `@v2`, and `@v5`), not immutable commit SHAs. |
| 12 | Secret scanning and push protection are enabled on the repository | NO | These settings could not be verified from the public repository view; confirm them in the repository's security settings. |

## Backend and security rules

If your app is fully local with no backend, mark every row N/A and say so once.

| # | Check | Yes / No / N/A | Evidence |
| --- | --- | --- | --- |
| 13 | Firestore and Storage rules are not left open to anyone; they require an authenticated user | N/A | The app is fully local and has no Firestore or Storage integration. |
| 14 | Rules restrict a user to their own documents where that makes sense | N/A | The app has no backend documents or user accounts. |
| 15 | If Supabase: Row Level Security is on for every table | N/A | The app has no Supabase integration or database tables. |
| 16 | Firebase and Google API keys are restricted in the Google Cloud console to the APIs and app they are for | N/A | The app has no Firebase integration or Google API keys. |
| 17 | I opened the app signed out and confirmed I could not read or write data I should not | N/A | The app has no sign-in, backend, or remote user data to access. |
| 18 | Seed and sample data is invented, not real people's data | YES | `lib/data/tarot_json.dart` contains tarot card names and descriptions; the app screens show tarot UI, not people's records. |

## Input and app surface

| # | Check | Yes / No / N/A | Evidence |
| --- | --- | --- | --- |
| 19 | Input is validated before it is written, not only styled as valid in the UI | N/A | The home screen has a search field, but it is not connected to persistence and no user input is written. |
| 20 | Nothing secret is recoverable from the built app, since a shipped binary can be unpacked | YES | No runtime credentials are used by the app or passed to its web build; `.env.example` contains placeholders only. |

## Repository and privacy

| # | Check | Yes / No / N/A | Evidence |
| --- | --- | --- | --- |
| 21 | No student number, personal email, phone number or home address in the repository or in commit messages | NO | Local commit metadata contains the author's personal email address; no student number, phone number, or home address was found in the reviewed files. |
| 22 | No classmate's personal data in the repository | YES | Reviewed app data and screenshots; they contain tarot content and app screens, not classmates' personal information. |
| 23 | Dependencies come from pub.dev, and `build/` and `.dart_tool/` are gitignored | YES | `pubspec.lock` resolves hosted packages from `pub.dev`; `.gitignore` excludes `build/` and `.dart_tool/`. |
| 24 | Images, fonts and other assets are mine, licensed, or credited | YES | Images are mine, and the respective authors are mentioned in the README.md and AI-USAGE |
| 25 | Repository visibility is deliberate, and I checked it after my last push | YES | The public GitHub repository is visible, and the README states that public visibility is intentional. |

## Anything I found and fixed

This review found no active credentials in the app or in the reviewed Git
history. It identified unpinned workflow actions, personal email in commit
metadata, and undocumented asset/font licensing; those issues are recorded
above and were not changed as part of this checklist update.
