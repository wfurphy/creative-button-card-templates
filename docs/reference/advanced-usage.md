# Advanced Usage

There are some addons and cards which are really only going to be of interest to you if you want to customise cards or are having some issues you don't understand.

## CBC JS (`cbcjs`)*

Shared client-side helper that powers effect/theme dropdowns, select option calls, and version checking. Included by default on most templates that need in-card scripting. Essential for most cards to work as expected.

## Button-Card Config (`bc_config`)

Exposes the resolved button-card config object to templates as variabe `__config`, this gives you access to perform advanced actions in your Javascript based on items other than the variables. If you're not sure what it's for, best to leave it alone!

## Debug

When added to a card's `template` list `debug` will write a `console.debug()` containing objects that can help you figure out what's happening. So in your browser inspector console you can see the button-card (`this`), the `variables`, `entity` objects and more. It comes in handy if things aren't working. If you're going to submit a issue on GitHub you'll need to be able to get this info. Remember to set the level of your browser console to All so you can see the debug messages. `debug_hass` now defaults to `true` and can be disabled via variables if needed._

### Debug Variables

| Variable | Values | Default | Description |
| - | - | - | - |
| `debug_hass` | Boolean | `true` | Include the full `hass` object in the console output. |
| `debug_extras` | Object | `{}` | Extra data to include in the debug output. |

## Detailed Entity Information (`entity_detail`)

Mostly used for creating and debugging the templates this card displays the full properties and attributes of an entity in a table.

![entity_detail card](../images/entity-detail.png)

### Entity Detail Variables

| Variable | Values | Default | Description |
| - | - | - | - |
| `do_not_split` | Array of attribute names | `[]` | Attributes to keep as a single value (prevents splitting on `,` or `|`). |

## Local Docs

If you want to contribute and are working on the docs locally:

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements-docs.txt
.venv/bin/mkdocs serve
```

Build the site with:

```sh
.venv/bin/mkdocs build --strict
```