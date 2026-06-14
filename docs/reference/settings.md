# Settings

Creative Button-Card Templates includes a `cbc_settings` template for options that control update checking and local usage stats.

## File Location

In YAML mode, copy `custom/cbc_settings.sample` to `custom/cbc_settings.yaml` and edit that file. The automated installer and the manual installation steps both expect this file structure:

```text
creative-button-card-templates/
  custom/
    cbc_settings.yaml
    cbc_settings.sample
```

In Storage (UI) mode, the same settings are included in the generated `cbc.yml`. Edit the `cbc_settings:` block before you paste it into the Raw Configuration Editor, or update your local `custom/cbc_settings.yaml` and run `bin/export` again.

The values live under:

```yaml
cbc_settings:
  variables:
    _cbc_settings:
      check_version:
        auto: true
        frequency: 14
        notify: true
      stats:
        generate: false
        hash_panels: false
```

## Version Check

As of version 0.3, there is an automated check so you can know if updates are available. **This feature does not send any data from your Home Assistant instance to any external server.** It is optional and you can set the check frequency and notifications in `custom/cbc_settings.yaml`.

### Version Check Settings `_cbc_settings.check_version:`

| Variable | Values | Default | Description |
| - | - | - | - |
| `auto` | Boolean (true/false) | `true` | Should CBC Check for updates. |
| `frequency` | Number (7 - 90) | `14` | How often to check for updates (in days). This is reset if you clear your browser's local storage for your Home Assistant domain. Check is performed once on first run, and then according to the check frequency.|
| `notify` | Boolean (true/false) | `true` | If an update is available show a 5 sec notification at the bottom of the dashboard on first load with a link to get the update. |

> 🙋‍♂️ _There is no data from your Home Assistant instance sent to any external server by the version check._

## Usage Stats

You can also track your usage of the templates with the built-in Usage Stats. This is completely optional and is not sent to any external server. Once enabled in `custom/cbc_settings.yaml` by setting `generate` to `true`, you can view stats by opening your web browser console and typing `cbcJS.getStats()`. This will show you the stats object, which contains the number of times each card and template has been used in your dashboards. You can reset these stats by clearing your browser's local storage for your Home Assistant domain.

If you wish to share the usage data with others, you may not want to include your dashboard (panel) names. Setting `hash_panels` to `true` will anonymise your dashboard (panel) names in the stats.

### View Usage Stats

Make sure you have set `_cbc_settings.stats.generate` to `true` in `custom/cbc_settings.yaml` and then you can view the stats with the following command in your browser console:

```javascript
// From your dashboard, open your browser console and type:
cbcJS.getStats()
```

### Usage Stats Settings `_cbc_settings.stats:`

| Variable | Values | Default | Description |
| - | - | - | - |
| `generate` | Boolean (true/false) | `false` | Generate usage statistics. |
| `hash_panels` | Boolean (true/false) | `false` | Anonymise dashboard (panel) names. |

> 🙋‍♂️ _I'd like to collect anonymous usage data so that I can focus on the most popular cards for improving later versions and ultimately creating a complete dashboard plugin._
