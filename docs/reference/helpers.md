# Helpers

The `cbc_helpers` addon provides small helper functions through the `variables` object. It is inherited by `cbcjs`, so it is available on most templates already. If you're creating your own custom template from scratch and want to use these helpers, include `cbc_helpers` in the template list.

These helpers are most useful when you have a main entity with related child entities using Home Assistant's usual object ID pattern. For example, a smart plug might use `switch.power_plug` as the main entity and expose related sensors like `sensor.power_plug_voltage`, `sensor.power_plug_current`, and `sensor.power_plug_power`.

### CBC Helpers (`cbc_helpers`)

#### Helper Functions

| Helper | Returns | Description |
| - | - | - |
| `$parentId(removal)` | String | Returns the current entity object ID without the domain. Optionally removes an extra string from the object ID. |
| `$childEntityId(name, domain, removal)` | String | Builds a related child entity ID from the current entity object ID, child name, and optional domain. |

#### `$parentId(removal)`

Gets the current entity object ID by removing the domain from `entity.entity_id`. If you pass `removal`, that value is also removed from the object ID before it is returned.

| Parameter | Value Type | Default | Description |
| - | - | - | - |
| `removal` | String | `''` | Optional text to remove from the current entity object ID. |

```js
variables.$parentId(removal);
```

For a card using `entity: switch.power_plug`:

```js
variables.$parentId(); // power_plug
```

For a card using `entity: switch.power_plug_switch`:

```js
variables.$parentId('_switch'); // power_plug
```

#### `$childEntityId(name, domain, removal)`

Builds a related child entity ID from the current entity. The helper removes the current entity domain, optionally removes extra text from the object ID, then appends `_<name>`.

| Parameter | Value Type | Default | Description |
| - | - | - | - |
| `name` | String |  | Child entity suffix to append to the parent object ID. If empty, the helper returns an empty string. |
| `domain` | String | `sensor` | Domain for the generated child entity ID. |
| `removal` | String | `''` | Optional text to remove from the current entity object ID before appending the child suffix. |

```js
variables.$childEntityId(name, domain, removal);
```

For a card using `entity: switch.power_plug`:

```js
variables.$childEntityId('voltage'); // sensor.power_plug_voltage
variables.$childEntityId('enable', 'input_boolean'); // input_boolean.power_plug_enable
```

For a card using `entity: switch.power_plug_switch`:

```js
variables.$childEntityId('power', 'sensor', '_switch'); // sensor.power_plug_power
```

#### Helpers Example YAML

<details><summary>See the YAML...</summary><p>

```yaml
type: custom:button-card
template: entity
entity: switch.power_plug
name: Power Plug
variables:
  attributes:
    - icon: mdi:flash
      entity: "[[[ return variables.$childEntityId('power'); ]]]"
    - icon: mdi:sine-wave
      entity: "[[[ return variables.$childEntityId('voltage'); ]]]"
```

</p></details>
