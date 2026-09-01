# Locize sync action

Synchronize translation files between your repository and [Locize](https://locize.com).
It uses the Locize CLI behind the scene. For detailed documentation of the Locize CLI, please [visit the documentation](https://github.com/locize/locize-cli#synchronize-locize-with-your-repository-or-any-other-local-directory).

## Inputs

### `api-key`

The api-key that should be used. **Required** unless `LOCIZE_API_KEY` (or `LOCIZE_APIKEY`) is set in the environment.

### `project-id`

The project-id that should be used. **Required** unless `LOCIZE_PROJECTID` (or `LOCIZE_PROJECT_ID`) is set in the environment.

### `path`

**Optional** Specify the path that should be used (default: current working directory).

### `version`

**Optional** The version that should be targeted (default: latest).

### `format`

**Optional** File format of namespaces (default: json; [nested, flat, xliff2, xliff12, xlf2, xlf12, android, yaml, yaml-rails, yaml-rails-ns, yaml-nested, yml, yml-rails, yml-nested, csv, xlsx, po, strings, resx, fluent, tmx, laravel, properties, xcstrings]).

### `clean`

**Optional** Removes all local files by removing the whole folder before downloading (default: false).

### `clean-local-files`

**Optional** Removes all local files without removing any folder (default: false).

### `update-values`

**Optional** Update values of existing translations on locize (default: false).

### `auto-translate`

**Optional** Trigger automatic AI/MT translation of updated translations (default: false). When enabled, any new or updated keys synced to the reference language will be automatically translated into all target languages using the project's configured AI or MT provider.

### `skip-delete`

**Optional** Skip the removal of keys on locize that were deleted locally (default: false).

### `delete-remote-namespace`

**Optional** Delete a complete namespace on locize if the local file in the reference language was deleted (default: false).

### `skip-empty`

**Optional** Skips to download empty files (default: false).

### `reference-language-only`

**Optional** Check for changes in reference language only (default: true).

### `changed-only`

**Optional** Only sync keys that changed on the current git branch compared to the base branch (default: false). The local reference-language files are diffed against the merge-base with the base branch; additions, value updates and auto-translation are restricted to those keys, and deletions are skipped. Keys are scoped per namespace file, and when any plural variant of a key changed, all its plural forms are included. Requires locize-cli >= 12.7 (installed automatically) and a checkout that includes the base branch, e.g. `actions/checkout` with `fetch-depth: 0`.

### `base`

**Optional** The git base branch/ref to compare against for `changed-only` (default: auto-detect `origin/HEAD`, then `main`, then `master`).

### `compare-modification-time`

**Optional** Take file modification time into account when comparing local and remote (default: false).

### `language`

**Optional** The language that should be targeted.

### `languages`

**Optional** Comma-separated list of languages that should be targeted.

### `namespace`

**Optional** The namespace that should be targeted (comma-separated list supported).

### `language-folder-prefix`

**Optional** This will be added as a local folder name prefix in front of the language.

### `path-mask`

**Optional** This will define the folder and file structure; do not add a file extension (default: {{language}}/{{namespace}}).

### `unpublished`

**Optional** Downloads the current (unpublished) translations. This will generate private download costs (default: false).

### `overridden-only`

**Optional** Downloads only the current overridden (unpublished) translations of a tenant or branch project (default: false).

### `branch`

**Optional** The branch name (or id) that should be targeted.

### `dry`

**Optional** Dry run — show what would change without actually syncing (default: false).

### `cdn-type`

**Optional** Specify the cdn endpoint that should be used (`standard` or `pro`, default: `standard`).

### `backup-deleted-path`

**Optional** Saves the segments that will be deleted in this path.

## Example usage

### Basic sync

```yaml
- uses: locize/sync@v2
  with:
    api-key: ${{ secrets.LOCIZE_API_KEY }}
    project-id: ${{ secrets.LOCIZE_PROJECT_ID }}
    path: locales
```

### Sync with automatic AI translation

```yaml
- uses: locize/sync@v2
  with:
    api-key: ${{ secrets.LOCIZE_API_KEY }}
    project-id: ${{ secrets.LOCIZE_PROJECT_ID }}
    path: locales
    auto-translate: true
```

### Sync then publish (complete CI/CD workflow)

```yaml
steps:
  - uses: actions/checkout@v4

  - uses: locize/sync@v2
    with:
      api-key: ${{ secrets.LOCIZE_API_KEY }}
      project-id: ${{ secrets.LOCIZE_PROJECT_ID }}
      path: locales
      auto-translate: true

  - run: npx locize-cli publish-version
    env:
      LOCIZE_API_KEY: ${{ secrets.LOCIZE_API_KEY }}
      LOCIZE_PROJECTID: ${{ secrets.LOCIZE_PROJECT_ID }}
```

### Sync a specific branch

```yaml
- uses: locize/sync@v2
  with:
    api-key: ${{ secrets.LOCIZE_API_KEY }}
    project-id: ${{ secrets.LOCIZE_PROJECT_ID }}
    path: locales
    branch: feature-v2
```

### Sync only a pull request's changes

Only the keys the PR added or modified are synced and auto-translated; nothing is deleted. The base branch must be available in the checkout, so use `fetch-depth: 0`:

```yaml
on:
  pull_request:

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v7
        with:
          fetch-depth: 0

      - uses: locize/sync@v2
        with:
          api-key: ${{ secrets.LOCIZE_API_KEY }}
          project-id: ${{ secrets.LOCIZE_PROJECT_ID }}
          path: locales
          auto-translate: true
          changed-only: true
```
