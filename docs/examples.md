# Dashboard Examples

![Template Samples using Noctis theme](images/cbc-samples-animated.gif)

_Examples above are shown in the default dark theme however they should work for most themes. They might require a couple of tweaks here and there. I prefer the excellent [Noctis theme](https://github.com/aFFekopp/noctis)_

<details><summary>See the YAML...</summary>
<p>

This is the code used to create the examples in the gif above. Some entity names omitted, of course.

```yaml
# ...cards:
- type: vertical-stack
  cards:
    - type: custom:button-card #                   ####| Title - Tab & Icon |####>
      template: title
      name: Creative Button-Card Templates
      icon: mdi:cards-outline
    - type: grid
      square: false
      columns: 2
      cards:
        - type: vertical-stack
          cards:
            - type: custom:button-card #               ####| Action. Button |####>
              template: button_action
              entity: timer.test_timer
              name: Action Button
            - type: custom:button-card #              ####| Title - Devices |####>
              template: title
              name: Devices
              icon: mdi:cellphone-link
              styles:
                icon:
                  - height: 110%
        - type: custom:button-card #                           ####| Device |####>
          template: device
          entity: switch.sample
          name: Device
          icon: mdi:tumble-dryer
        - type: custom:button-card #              ####| Device - Attributes |####>
          template: device
          entity: switch.sample
          name: Device
          icon: mdi:nuke
          variables:
            attributes:
              - id: voltage
                icon: mdi:alien
                state: '1x '
                units: Attribute
        - type: custom:button-card #                             ####| Plug |####>
          template: plug
          entity: switch.sample
          name: Smart Plug
    - type: grid
      square: false
      columns: 2
      cards:
        - type: custom:button-card #                   ####| Title - Lights |####>
          template: title
          name: Lights
          icon: mdi:lamps
          styles:
            card:
              - margin-top: 40px
        - type: custom:button-card #                            ####| Light |####>
          template: light
          entity: light.sample
          name: Light
        - type: custom:button-card #                   ####| Light - Motion |####>
          template: light_motion
          entity: light.sample
          name: Light & Motion
          variables:
            motion_entity: binary_sensor.sample
        - type: custom:button-card #                      ####| Light Group |####>
          template:
            - light_group
          entity: light.sample
          name: Light Group
          variables:
            items:
              - entity: light.sample
                symbol: mdi:stairs
                icon: mdi:home
              - entity: light.sample
                symbol: C
              - entity: light.sample
                icon: mdi:lightbulb-spot
                symbol: 8
- type: vertical-stack  #                                #########################| COLUMN |#####################>
  cards:
    - type: horizontal-stack #                           ####| Mini Buttons |####>
      cards:
        - type: custom:button-card
          template: title
          name: "Mini Buttons"
          icon: mdi:arrow-right
        - type: custom:button-card #          ####| Button Mini DND |####>
          template:
            - button_mini
            - dynamic_icons
          color_type: card
          color: "#9d3042"
          entity: input_boolean.sample
          variables:
            icon: mdi:bell
            icon_on: mdi:bell-off
            width: 70px
        - type: custom:button-card #        ####| Button Mini Power |####>
          template: button_mini
          icon: mdi:power
          entity: switch.sample
          variables:
            width: 70px
    - type: custom:button-card #                         ####| Value Strips |####>
      template: title
      name: Value Strips
      icon: mdi:led-strip
    - type: grid
      columns: 2
      square: false
      cards:
        - type: custom:button-card #         ####| Brightness Strip |####>
          template:
            - value_strip
          variables:
            type: brightness
            show:
              icon: false
              step_value: true
          entity: light.sample
        - type: custom:button-card #         ####| Brightness Strip |####>
          template:
            - value_strip
          variables:
            type: adaptive_lighting
            al_area_id: den
            show:
              icon: true
              step_value: true
        - type: custom:button-card #         ####| Brightness Strip |####>
          template:
            - value_strip
            - transparent
          variables:
            type: adaptive_lighting
            al_area_id: den
            show:
              icon: true
              step_value: false
        - type: custom:button-card #             ####| Blinds Strip |####>
          template:
            - value_strip
          entity: cover.den_blinds
          variables:
            type: cover
            show:
              icon: true
              step_value: true
              fade: false
            items:
            - step_value: 0
              icon: mdi:blinds
              units: '%'
              label: close
            - step_value: 25
              icon: mdi:blinds
              units: '%'
            - step_value: 50
              icon: mdi:blinds-open
              units: '%'
            - step_value: 75
              icon: mdi:blinds-open
              units: '%'
            - step_value: 100
              icon: mdi:blinds-open
              units: '%'
              label: open
    - type: horizontal-stack #                             ####| Info Cards |####>
      cards:
        - type: custom:button-card
          template: title
          name: Info Cards
          icon: mdi:information-outline
        - type: custom:button-card #                ####| Info Mini |####>
          template:
            - info_mini
            - transparent
          variables:
            state: 99
            units: win
          icon: mdi:trophy
    - type: custom:button-card #                     ####| Info x 3 |####>
      template:
        - info
      variables:
        items:
          - entity_id: sensor.sample
            name: Custom Color
            color: '#e04632'
            decimals: 2
          - entity_id: cover.den_blinds
            attribute: current_position
            units: 'ATTRIBUTE '
            prefix_units: true
          - icon: mdi:lightbulb-variant
            name: No Entity
            state: 'Custom'
    - type: custom:button-card #         ####| Info x 4 Transparent |####>
      template:
        - info
        - transparent
      variables:
        items:
          - entity_id: sensor.sample
            name: Rounding
            decimals: 0
          - icon: mdi:cash
            name: Currency
            state: '47.3'
            units: '$'
            color: "#00b59d"
          - entity_id: sensor.sample
            name: "Sensor"
            color: "#febe6e"
          - entity_id: input_number.air_circulation_frequency
            name: Custom Icon
            icon: mdi:clock-outline
    - type: horizontal-stack #                             ####| Info Minis |####>
      cards:
        - type: custom:button-card #                     ####| Spin |####>
          template:
            - transparent
            - info_mini
          entity: cover.den_blinds
          variables:
            attribute: current_position
            units: 'SPIN'
            state: '↻'
            rotate: true
            icon_color: 'rgba(247, 138, 80, 0.2)'
          icon: mdi:fan
        - type: custom:button-card #                   ####| Inline |####>
          template:
            - info_mini
            - transparent
          entity: cover.den_blinds
          icon: mdi:chart-pie
          variables:
            icon_color: 'rgba(157, 48, 66, 0.4)'
            layout: inline
            attribute: current_position
            units: '%'
        - type: custom:button-card #               ####| Background |####>
          template:
            - info_mini
          entity: input_number.air_circulation_frequency
          icon: mdi:clock-time-nine-outline
        - type: custom:button-card #             ####| Mirror Title |####>
          template: title
          name: Info Mini
          icon: mdi:arrow-left
          variables:
            mirror: true
# ...
```

</p>
</details>

 > "What card are you using for that? I want to use that on mine!"

I made this repo for my friends who were asking me the above question. If you're someone else who's managed to stumble across them then hello and you're welcome to use them. If you like them then please send your kudos to [@RomRider](https://github.com/RomRider) and everyone who contributed to [Button Card](https://github.com/custom-cards/button-card) which is the only reason these templates were possible.
