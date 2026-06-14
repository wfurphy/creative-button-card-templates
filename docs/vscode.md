# VSCode

## Button-Card Javascript Support in YAML for VSCode

[![release](https://img.shields.io/github/v/release/wfurphy/vscode-button-card-js)](https://github.com/wfurphy/vscode-button-card-js/releases)
[![license](https://img.shields.io/github/license/wfurphy/vscode-button-card-js)](https://github.com/wfurphy/vscode-button-card-js/blob/master/LICENSE)

This is a very niche extension for Visual Studio Code which provides embedded Javascript language support for code blocks in YAML enclosed by triple+ square brackets (`[[[ ... ]]]`). Used when configuring the advanced _javascript templates_ properties of [Button-Card](https://github.com/custom-cards/button-card) cards for Home Assistant Lovelace dashboards.

- Javascript is now treated as an embedded language, not just YAML string content with syntax highlighting.
- ESLint diagnostics are shown for JavaScript inside matching Button-Card templates when an ESLint configuration is available in the workspace.
- Double quoted and block YAML strings are supported.
- Button-Card 7.0+ [nested templates](https://custom-cards.github.io/button-card/v7.0/examples/js-templates/#nested-custombutton-card) are supported with longer bracket sequences like `[[[[ ... ]]]]`+.
- It works with the standard YAML language and the `home-assistant` YAML language created by the [Home Assistant Config Helper](https://github.com/keesschollaart81/vscode-home-assistant) plugin.
- ESLint support is included.

> 🙋‍♂️ _I made this while I was working on [Creative Button Card Templates](https://github.com/wfurphy/creative-button-card-templates) and could not handle writing any more JS without syntax highlighting. Hopefully it can also provide you with relief from the same, same, string game!_

## Preview

![VSCode BC JS Example](https://raw.githubusercontent.com/wfurphy/vscode-button-card-js/master/images/vscodebcjs-example.png)

_The preview above is using the OneDark Pro theme, however this plugin will work with any theme that supports YAML and JavaScript._

## Installation

Install from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=wfurphy.vscode-button-card-js) or [Open VSX Registry](https://open-vsx.org/extension/wfurphy/vscode-button-card-js).

## Usage

Once installed you don't need to do anything else. Just open a YAML file that contains `[[[ ... ]]]` blocks and you should see the JavaScript syntax highlighting and language features working inside those blocks.

The JavaScript in single line `"[[[ ... ]]]"` templates needs to be terminated with a closing semicolon (`;`) or else it can break the syntax highlighting in some cases.

## ESLint

ESLint doesn't support the linting of embedded JavaScript within YAML files by default. However, the extension extracts JavaScript from Button-Card `[[[ ... ]]]` templates and runs ESLint against those snippets in the background. Feedback is mapped back to the original YAML so lint errors appear on the embedded JavaScript code inline just like you're used to.

You will need to have [ESLint](https://eslint.org/) installed in your project for linting to work. Syntax highlighting and embedded JavaScript language support still work normally when ESLint is not installed.

The extension will pick up your project's ESLint configuration if available. If no ESLint configuration is available, it falls back to syntax-only JavaScript parsing. I strongly recommend adding the globals below to avoid false positives since the JavaScript templates have access to Home Assistant and Button-Card specific variables that ESLint would otherwise not recognise.

### Recommended ESLint Configuration

Install ESLint in the project that contains your Button-Card templates:

```sh
npm install --save-dev eslint
```

Then add an `eslint.config.mjs` file in the project root:

```js
export default [
  {
    files: [
      '**/*.yaml.button-card-*.js',
      '**/*.yml.button-card-*.js'
    ],
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'script',
      globals: {
        entity: 'readonly',
        entities: 'readonly',
        states: 'readonly',
        variables: 'readonly',
        user: 'readonly',
        hass: 'readonly',
        config: 'readonly',
        helpers: 'readonly',
        console: 'readonly',
        window: 'readonly',
        document: 'readonly',
        localStorage: 'readonly',
        setTimeout: 'readonly',
        clearTimeout: 'readonly',
        setInterval: 'readonly',
        clearInterval: 'readonly',
        fetch: 'readonly',
        cbcJS: 'readonly',
        CBCError: 'readonly',
        CBCWarn: 'readonly'
      }
    },
    rules: {
      'no-undef': 'error',
      'no-unused-vars': ['warn', {
        args: 'none',
        varsIgnorePattern: '^_',
        caughtErrors: 'none'
      }],
      'no-redeclare': 'error',
      'no-unreachable': 'error',
      'no-constant-condition': 'warn',
      eqeqeq: ['warn', 'smart'],
      curly: ['warn', 'multi-line'],
      'no-var': 'error',
      'prefer-const': 'warn',
      'object-shorthand': 'warn',
      'no-console': 'off'
    }
  }
];
```

### VSCode Settings

```json
{
  "buttonCardJs.eslint.enable": true,
  "buttonCardJs.eslint.run": "onType"
}
```
