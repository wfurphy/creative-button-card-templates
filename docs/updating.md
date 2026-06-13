# Updating

## YAML Mode

1. Open a terminal on your HA install.
2. Navigate to where you installed Creative Button-Card Templates (eg. `/config/creative-button-card-templates/`)

> :raising_hand: _If you have made any changes to the source files (eg. modified files outside of the `custom` folder) then make sure to run `git stash` to stash them before you pull the latest changes. If you don't do this then you will lose those changes when you pull the latest files._

### Updating from v0.2.x (Updating from v0.3+ skip this step)

3. navigate to the installation directory (`/config/creative-button-card-templates/` or wherever you installed it) and run the following command to update:

    ```sh
    curl -fsSL https://raw.githubusercontent.com/wfurphy/creative-button-card-templates/refs/heads/master/bin/update | bash
    ```

### Updating from v0.3+

4. navigate to the installation directory (`/config/creative-button-card-templates/` or wherever you installed it) and run

```
bin/update
```


## Storage (UI) Mode

> If you have custom templates follow the instructions above for Upgrade and then run `bin/export` to create an updated `cbc.yml` file with your custom templates included. If you have no custom templates then simply download the latest `cbc.yml` from the releases page.

1.
  - A. Copy the contents of [`cbc.yml` from the latest release](https://github.com/wfurphy/creative-button-card-templates/releases/latest/download/cbc.yml)
  - OR
  - B. If you originally cloned this repository and/or created custom templates, follow steps 1-4 above and then run `bin/export` and copy the contents of the resulting `cbc.yml`.
2. Open a browser and navigate to your Home Assistant dashboard.
3. Click the three dots in the top right corner and choose `Edit Dashboard`.
4. Click three dots again and choose `Raw Configuration Editor`.
5. Highlight all of the existing content of `button_card_templates:`. This will probably be from the first line to just above `views:`.
6. Replace the highlighted text with the copied text.
7. click **Save** and close the raw configuration editor.
