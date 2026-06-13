# Updating

## YAML Mode

1. Open a terminal on your HA install.
2. Navigate to where you installed Creative Button-Card Templates (eg. `/config/creative-button-card-templates/`)

> :raising_hand: _If you have made any changes to the source files (eg. modified files outside of the `custom` folder) then make sure to run `git stash` to stash them before you pull the latest changes. If you don't do this then you will lose those changes when you pull the latest files._

### Updating from v0.2.x (Updating from v0.3+ skip this step)

3. Make sure you're on the `master` branch (`git branch --show-current`), if not (`git checkout master`) and run `git pull`. then continue to step 4.

### Updating from v0.3+

4. run 'bin/update' to update the source files and export the latest `cbc.yml`.

## Storage (UI) Mode

1. a. Copy the contents of [`cbc.yml` from the latest release](https://github.com/wfurphy/creative-button-card-templates/releases/latest/download/cbc.yml)
    OR
   b. If you originally cloned this repository and/or created custom templates, follow steps 1-4 above and then run `bin/export` and copy the contents of the resulting `cbc.yml`.
2. Open a browser and navigate to your Home Assistant dashboard.
3. Click the three dots in the top right corner and choose `Edit Dashboard`.
4. Click three dots again and choose `Raw Configuration Editor`.
5. Highight all of the existing content of `button_card_templates:`. This will probably be from the first line to just above `views:`.
6. Replace the highlighted text with the copied text.
7. click **Save** and close the raw configuration editor.
