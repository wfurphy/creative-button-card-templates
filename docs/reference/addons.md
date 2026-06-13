# Addons

You can use any addon by including it after your template in a list as shown in the example above. Addons with a star (*) are included in _most_ templates already.

## Date Time (`datetime`)

Adds a shared `__dateString(date, format)` helper function for formatting dates in templates and addons. Supports `full`, `short`, `next`, `relative`, `day`, and `month` output modes. _This is obsolete now that button-card have their own helper functions and may be deprecated and removed in future versions!_

## Actions (`actions`)*

The `actions` addon will add the `toggle` action for single tap and `more-info` action for hold and double tap as well as the haptic `success` for the iOS app. It's included in most of the button templates by default.

## No Actions (`no_actions`)

The `no_actions` addon does the opposite of above. It removes the standard functionality and sets your card to have no actions.

## Dynamic Icons (`dynamic_icons`)

The `dynamic_icons` addon will add functionality to the card which will change the icon dependant on the state of the entity. It works for all entities that have an "on" and "off" state.

> :raising_hand_man: _If you just want to have a static custom icon for your card then it's easiest just to populate the `icon` property of your button-card. You only need to use this addon if you would like different icons for different states._

### Dynamic Icon Variables

| Variable | Values | Default | Description |
| - | - | - | - |
| `icon` | `mdi:*` | `mdi:toggle-switch-off` | The icon to display when the entity is off. |
| `icon_on` | `mdi:*` | `mdi:toggle-switch` | The icon to display when the entity is on. |
| `icon_unavailable` | `mdi:*` | `mdi:wifi-cancel` | The icon to display when the entity is unavailable. |

## Resizable (`resizable`)*

The `resizable` addon allows you to use `height` and `width` variables to define the size of the card (some templates have min or max sizes set though). It's added to most button templates already so you only need to include the variables to set a custom size for your card.

### Resizable Variables

| Variable | Values | Default | Description |
| - | - | - | - |
| `height` | String (CSS) | _per card_ | The height of the card in any CSS accepted value. Eg `40px` or `90%` |
| `width` | String (CSS) | _per card_ | The width of the card in any CSS accepted value. Eg `40px` or `90%` |
| `min_height` | String (CSS) | _per card_ | The minimum height of the card in any CSS accepted value. |
| `min_width` | String (CSS) | _per card_ | The minimum width of the card in any CSS accepted value. |
| `max_height` | String (CSS) | _per card_ | The maximum height of the card in any CSS accepted value. |
| `max_width` | String (CSS) | _per card_ | The maximum width of the card in any CSS accepted value. |

## Transparent (`transparent`)

The `transparent` addon will make the background of your card transparent, remove it's `box-shadow` and `border`. I find this looks great with `value_strip` and `info_mini` templates but you can use it on any you like.
