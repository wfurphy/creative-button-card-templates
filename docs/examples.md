# Dashboard Examples

![Template Samples using Noctis theme](images/cbc-samples-animated.gif)

_Examples above are shown in the default dark theme however they should work for most themes. They might require a couple of tweaks here and there. I prefer the excellent [Noctis theme](https://github.com/aFFekopp/noctis)_

<details><summary>See the YAML...</summary>
<p>

This is the code used to create the examples in the gif above, with example entity names.

```yaml
- type: vertical-stack
  cards:
    - type: custom:button-card
      template: title
      name: Creative Button-Card Templates
      icon: mdi:cards-outline
      variables:
        background_color: '#7b54bf'
    - type: horizontal-stack
      cards:
        - type: vertical-stack
          cards:
            - type: custom:button-card
              template: button_action
              entity: script.example_action
              variables:
                timer: timer.example_timer
              name: Action Button
            - type: custom:button-card
              template: select
              entity: input_select.example_selector
            - type: custom:button-card
              template:
                - climate
              entity: climate.air_conditioner
              name: Climate
              icon: mdi:fan
            - type: custom:button-card
              template:
                - entity
              entity: switch.smart_plug
              name: Entity
              icon: mdi:power-socket-au
              variables:
                debug: true
                attributes:
                  - icon: mdi:sine-wave
                    entity: "[[[ return variables.$childEntityId('voltage'); ]]]"
                  - icon: mdi:alien
                    state: 'Custom '
                    units: Attribute
        - type: vertical-stack
          cards:
            - type: custom:button-card
              template: cover
              entity: cover.window_blinds
              name: Cover
            - type: custom:button-card
              template: title
              name: Lights
              icon: mdi:lamps
              styles:
                card:
                  - margin-top: 5px;
            - type: custom:button-card
              template:
                - light_group
              entity: light.room_lights
              name: Light Group
              icon: mdi:lightbulb-multiple
              variables:
                show:
                  effect_selector: true
                  theme_selector: true
                items:
                  - entity: light.ceiling_light_1
                    symbol: E1
                  - entity: light.ceiling_light_2
                    symbol: E2
                  - entity: light.wall_light_1
                    symbol: W1
                  - entity: light.wall_light_2
                    symbol: W2
                  - entity: light.accent_strip
                    symbol: mdi:desk-lamp
                  - entity: light.floor_lamp
                    icon: mdi:floor-lamp-dual
            - type: custom:button-card
              template: light_motion
              entity: light.floor_lamp
              name: Light & Motion
              variables:
                motion_entity: binary_sensor.entry_motion_occupancy
                active_entity: input_boolean.motion_active
    - type: custom:gap-card
      height: 50
- type: vertical-stack
  cards:
    - type: horizontal-stack
      cards:
        - type: custom:button-card
          template: title
          name: "Mini Buttons"
          icon: mdi:arrow-right
        - type: custom:button-card
          template:
            - button_mini
            - dynamic_icons
          color_type: card
          color: "#9d3042"
          entity: input_boolean.do_not_disturb
          variables:
            icon: mdi:bell
            icon_on: mdi:bell-off
            width: 60px
        - type: custom:button-card
          template: button_mini_power_area
          icon: mdi:power
          variables:
            area: living_room
            width: 60px
    - type: custom:button-card
      template: title
      name: Value Strips
      icon: mdi:led-strip
    - type: grid
      columns: 2
      square: false
      cards:
        - type: custom:button-card
          template:
            - value_strip
            - debug
          variables:
            type: brightness
            show:
              icon: false
              step_value: true
          entity: light.floor_lamp
        - type: custom:button-card
          template:
            - value_strip
            - debug
            - transparent
          variables:
            type: adaptive_lighting
            al_area_id: living_room
            show:
              icon: true
              step_value: true
        - type: custom:button-card
          template:
            - value_strip
            - debug
            - transparent
          variables:
            type: adaptive_lighting
            al_area_id: living_room
            show:
              icon: true
              step_value: false
        - type: custom:button-card
          template:
            - value_strip
            - debug
          entity: cover.window_blinds
          variables:
            type: cover
            show:
              icon: true
              step_value: true
              fade: false
    - type: horizontal-stack
      cards:
        - type: custom:button-card
          template: title
          name: Info Cards
          icon: mdi:information-outline
        - type: custom:button-card
          template:
            - info_mini
            - transparent
          variables:
            state: 99
            units: win
          icon: mdi:trophy
    - type: custom:button-card
      template: info
      variables:
        items:
          - entity_id: sensor.room_temperature
            name: Custom Color
            color: '#e04632'
            decimals: 2
          - entity_id: cover.window_blinds
            attribute: current_position
            units: 'ATTRIBUTE '
            prefix_units: true
          - icon: mdi:lightbulb-variant
            name: No Entity
            state: 'Custom'
    - type: custom:button-card
      template:
        - info
        - transparent
      variables:
        items:
          - entity_id: sensor.room_temperature
            name: Rounding
            decimals: 0
          - icon: mdi:cash
            name: Currency
            state: '47.3'
            units: '$'
            color: "#00b59d"
          - entity_id: binary_sensor.door_contact
            name: "Sensor"
            color: "#febe6e"
            state: "[[[[ return entity.state === 'off' ? 'Closed' : 'Open' ]]]]"
          - entity_id: input_number.circulation_frequency
            name: Custom Icon
            icon: mdi:clock-outline
    - type: horizontal-stack
      cards:
        - type: custom:button-card
          template:
            - info_mini
            - transparent
          variables:
            attribute: current_position
            units: 'SPIN'
            state: '↻'
            spin: true
            icon_color: 'rgba(247, 138, 80, 0.2)'
          icon: mdi:fan
        - type: custom:button-card
          template:
            - info_mini
            - transparent
          entity: cover.window_blinds
          icon: mdi:chart-pie
          variables:
            icon_color: 'rgba(157, 48, 66, 0.4)'
            layout: inline
            attribute: current_position
            units: '%'
        - type: custom:button-card
          template:
            - info_mini
          entity: input_number.circulation_frequency
          icon: mdi:clock-time-nine-outline
        - type: custom:button-card
          template: title
          name: Info Mini
          icon: mdi:arrow-left
          variables:
            mirror: true
```

</p>
</details>

## Noctis Example

![Template Samples using Noctis theme](images/cbc-samples-animated.gif)
