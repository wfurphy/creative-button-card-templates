# Creative Button-Card Templates

![release](https://img.shields.io/github/v/release/wfurphy/creative-button-card-templates)
![license](https://img.shields.io/github/license/wfurphy/creative-button-card-templates)

A collection of [Button Card](https://github.com/custom-cards/button-card) templates to improve the build speed and quality of your Home Assistant Lovelace dashboards.

![Template Samples using Noctis theme](images/cbc-samples-animated.gif)

## Documentation

The full documentation now lives in the GitHub Pages site built with MkDocs Material:

- [Getting Started](docs/getting-started.md)
- [Examples](docs/examples.md)
- [Templates](docs/templates.md)
- [Addons](docs/reference/addons.md)
- [Helpers](docs/reference/helpers.md)
- [Advanced Usage](docs/reference/advanced-usage.md)
- [Customisation](docs/customisation.md)

The published site is configured for:

https://wfurphy.github.io/creative-button-card-templates/

## Quick Install

If you are using Lovelace YAML mode, clone this repository into your Home Assistant config directory and include it before any other dashboard content:

```yaml
####| Creative Button-Card Templates |#################################################>
####| Will Furphy | https://github.com/wfurphy/creative-button-card-templates
button_card_templates: !include_dir_merge_named creative-button-card-templates/
#################################################################################/
```

For Storage (UI) mode, copy the generated `cbc.yml` from the latest release into the Raw Configuration Editor.

## Local Docs Development

```sh
pip install -r requirements-docs.txt
mkdocs serve
```

Build the site locally with:

```sh
mkdocs build --strict
```
