# Custom Button Card Templates

A collection of [Button Card](https://github.com/custom-cards/button-card) templates to improve the speed and quality of your Home Assistant dashboards.

 > "What card are you using for that? I want to use that on mine!"

_I made this repo for my friends who were asking me the above question. If you don't know me and somehow managed to stumble across these then feel free to use them but please be aware that there's no guarantee that they will be maintained, that they are not going to break your dashboard or that they even work the way they are described! **Use them at your own risk.** If you like them then please send your thanks, kudos and coffee money to [@RomRider](https://github.com/RomRider) for creating [**Button Card**](https://github.com/custom-cards/button-card) which is the only reason these templates were possible._

## Prerequisites

You will need to ensure you have the following components installed. They are both available on [HACS](https://hacs.xyz/).

### [custom-cards/button-card](https://github.com/custom-cards/button-card)

The very first step is to ensure you have [**Button Card**](https://github.com/custom-cards/button-card) installed and working in home assistant. These templates are not going to work without it! You may notice, as I have, that it hasn't been maintained in some time. However, it all appears to be working perfectly still (_Last Checked HA 2022.10.4_). Perhaps if issues arise I will finally have to bite the bullet and develop my own custom card.

> If you plan to further extend these templates or create your own then it is essential that you read [the button-card documentation](https://github.com/custom-cards/button-card).

### [thomasloven/lovelace-card-mod](https://github.com/thomasloven/lovelace-card-mod)

I've used card-mod for a few tweaks here and there. It's required for most decent custom cards and themes anyway so you may have it already.

## Installation

### YAML Mode

If you are using your lovelace dashboards in [yaml mode](https://www.home-assistant.io/dashboards/dashboards/) already:

 1. Navigate to the home assistant `config` directory where you keep your `ui-lovelace.yaml`, in hassOS this is usually:

  ```sh
   cd /config/ui-lovelace.yaml
   ```

 2. Either;
    1. Clone this repository (recommended as updates will be much easier)

    ```sh
    git clone https://github.com/wfurphy/ha-button-card-templates.git
    ```

    1. **OR**; Make a new folder called `ha-button-card-templates/` or a custom name if you choose, download the latest release and copy the entire contents to this location.

 3. Include the following snippet at the top of your `ui-lovelace.yaml`. _If you've used a custom directory then obviously replace `ha-button-card-templates/` with a relative path to your installation directory._

```yaml
############| HA Button Card Templates |###########################################>
#### Some templates for the custom button cards I use in Home Assistant.
#### Will Furphy | https://github.com/wfurphy/ha-button-card-templates
#### Requires: https://github.com/custom-cards/button-card
button_card_templates: !include_dir_merge_named ha-button-card-templates/
###########################################################################/
```

### Storage (UI) Mode

If you're using storage mode (or editing your dashboards using the UI):

1. Clone this repository anywhere you like then navigate to the directory in your terminal and run the following command:

```sh
cat *.yaml >> all.yaml
```

2. Open `all.yaml` in your chosen editor and copy the entire contents.
3. Open a browser and navigate to your Home Assistant dashboard.
4. Click the three dots in the top right corner and choose `Edit Dashboard`.
5. Click three dots again and choose `Raw Configuration Editor`.
6. Paste the copied template yaml at the very top.
7. Save and close the raw configuration editor.

## Templates

You can override any button-card options in the yaml on each card but be aware that if you do you may overwrite the functionality of the template. Read the button-card documentation for more information.

### Device (`device`)

This template is used for the base of most other templates. It's for use with any generic device that you may want to have a button for.

