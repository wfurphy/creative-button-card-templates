# Getting Started

## Prerequisites

You will need to ensure you have the following components installed. They are both available on [HACS](https://hacs.xyz/).

### [custom-cards/button-card](https://github.com/custom-cards/button-card)

The very first step is to ensure you have [Button Card](https://github.com/custom-cards/button-card) installed and working in home assistant. These templates are not going to work without it!

> 🙋‍♂️ _If you plan to further extend these templates or create your own then it is **essential** that you read the [button-card documentation](https://custom-cards.github.io/button-card/stable/). In fact, I recommend you read it regardless._

### [thomasloven/lovelace-card-mod](https://github.com/thomasloven/lovelace-card-mod)

I've used card-mod for a few tweaks here and there. It's required for most decent custom cards and themes anyway so you may have it already.

## Installation

### YAML Mode

If you are using your lovelace dashboards in [yaml mode](https://www.home-assistant.io/dashboards/dashboards/) (Recommended):



#### Automated Installation

1. Open a terminal on your Home Assistant host and navigate to the config directory where you keep your `ui-lovelace.yaml`, in Home Assistant OS this is usually `/config`.
2. Run the following command to clone this repository and install Creative Button-Card Templates:

     ```sh
     curl -fsSL https://raw.githubusercontent.com/wfurphy/creative-button-card-templates/refs/heads/master/bin/install | bash
     ```

#### Manual Installation

1. Open a terminal on your Home Assistant host and navigate to the config directory where you keep your `ui-lovelace.yaml`, in Home Assistant OS this is usually `/config`.
2. Clone this repository:

     ```sh
     git clone https://github.com/wfurphy/creative-button-card-templates.git
    ```
3. Navigate into the `creative-button-card-templates` directory and copy `custom/cbc_settings.sample` to `custom/cbc_settings.yaml`. If you like you can open it and change any settings or leave them as default.

     ```sh
     cd creative-button-card-templates && cp custom/cbc_settings.sample custom/cbc_settings.yaml
    ```

4. Include the following snippet **before any other content** in your `ui-lovelace.yaml` or any dashboard file where you wish to use the templates. _If you've used a custom directory then obviously replace `creative-button-card-templates/` with a relative path to your chosen installation directory._

      ```yaml
      ####| Creative Button-Card Templates |#################################################>
      ####| Will Furphy | https://github.com/wfurphy/creative-button-card-templates
      button_card_templates: !include_dir_merge_named creative-button-card-templates/
      #################################################################################/
      ```

### Storage (UI) Mode

If you're using storage mode (or editing your dashboards using the UI):

1. A. If you have no custom templates, B if you do!
  - A. Open the [`cbc.yml` file from the latest release](https://github.com/wfurphy/creative-button-card-templates/releases/latest/download/cbc.yml) and copy the contents.
  - OR
  - B. Clone this repository to wherever you would like to keep the files and then run `bin/export` script to create `cbc.yml`. (If you plan to create custom templates then this is the way for you!):

    ```sh
    git clone https://github.com/wfurphy/creative-button-card-templates.git && \
    cd creative-button-card-templates && \
    bin/export
    ```

  > 🙋‍♂️ _There are some advanced options like excluding custom templates, use `bin/export --help` to see them._

2. Open `cbc.yml` in your chosen text editor, **select all** and **copy** the entire contents to the clipboard.
3. Open a browser and navigate to your Home Assistant dashboard.
4. Click the three dots in the top right corner and choose `Edit Dashboard`.
5. Click three dots again and choose `Raw Configuration Editor`.
6. Put your cursor on the very first line before any content (usually `views:`) and hit return to move it down so the first line is now blank.
7. On that blank first line, **paste** the copied text from `cbc.yml`.
8. Click **Save** and close the raw configuration editor.

## Using the Templates

> 🙋‍♂️ _This is all going to make much more sense to you if you have read the [button-card documentation](https://custom-cards.github.io/button-card/stable/)._

To use the templates simply specify the `template` property in your button-card yaml. For most you'll need to specify your `entity` (although some don't need it, like `title`). This is all you need for a light card:

```yaml
type: custom:button-card
template: light
entity: light.bedside_lamp
# ...
```

You can use multiple templates and/or addons by defining them as a list in the `template` property. Define the template(s) first then the addons.

```yaml
type: custom:button-card
template:
  - light
  - transparent
entity: light.bedside_lamp
# ...
```

Of course, it's still possible to customise things like `name` and `icon` or other properties available in button-card. Any properties you specify will override the template properties. For example, if I wanted to use a name and icon other than the ones specified in the entity for this light:

```yaml
type: custom:button-card
template: light
entity: light.bedside_lamp
name: Front Door Light
icon: mdi:lamp
# ...
```

> 🙋‍♂️ _Some properties are used to provide the features of the template and overriding them will break the functionality. For example the device and light cards make use of the `label` property. However, they should only be one's you are unlikely to use. If you have one that's not working, go and check out the template YAML and check if you're overriding anything vital!_

### Variables

The templates allow you to set most options via the `variables` property. You only ever define one `variables` property, just include any variables from any of the templates or addons that you've specified. Here's an example for a device card with a custom width, 1 attribute and dynamic icons:

```yaml
type: custom:button-card
template:
  - device
  - dynamic_icons
entity: switch.something
variables:
  width: 200px
  attributes:
    - id: that_attribute
      icon: mdi:plus
  icon: "mdi:wifi"
  icon_on: "mdi:wifi-star"
  icon_unavailable: "mdi:wifi-cancel"
# ...
```

#### Helper Variables

There are a couple of shared helper variables available for building tidy Javascript templates. They always start with a `$` and are documented in the [Helpers](reference/helpers.md) section below.

```yaml
type: custom:button-card
template: entity
entity: switch.smart_plug
variables:
  attributes:
    - icon: mdi:sine-wave
      entity: "[[[ return variables.$childEntityId('voltage'); ]]]"
```
