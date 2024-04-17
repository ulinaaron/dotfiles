# Prettier Plugin for micro

This plugin provides the ability to format your code with Prettier in [micro](https://github.com/zyedidia/micro).

## Requirements

It requires that you have `prettier` available in your path. So, `npm i -g prettier` would do the job in most cases.

## Options

These are the available configuration options right now:

- `formatOnSave`: Format everytime your save (default: `true`)
- `requireConfig`: If used a `.prettierrc.js` file in your working directory is required (default: `true`)
- `successMessage`: Print success message after formatting (default: `true`)
- `debug`: Print error messages in InfoBar (default: `false`)

## Install

Add this repo as a `pluginrepos` option like this:

```json
"pluginrepos": [
  "https://raw.githubusercontent.com/sebkolind/micro-prettier/master/repo.json"
],
```

Install with `> plugin install prettier`.

## Roadmap

- [ ] Check for other configuration files than `.prettierrc.js`
