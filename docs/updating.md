# Updating

## YAML Mode

1. Open a terminal on your HA install.
2. Navigate to where you installed Creative Button-Card Templates (eg. `/config/creative-button-card-templates/`)

> 🙋‍♂️ If you're updating then make sure to keep an eye out for the breaking changes which are highlighted throughout the docs like this: 🧨 _Breaking Change:_

> 🙋‍♂️ _If you have made any changes to the source files (eg. modified files outside of the `custom` folder) then make sure to run `git stash` to stash them before you pull the latest changes. If you don't do this then you will lose those changes when you pull the latest files._

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

<ol>
  <li>Choose the update source:
    <ol type="A">
      <li>If you have no custom templates, copy the contents of <a href="https://github.com/wfurphy/creative-button-card-templates/releases/latest/download/cbc.yml"><code>cbc.yml</code> from the latest release</a>.</li>
      <li>If you installed Creative Button-Card Templates with the install script and/or created custom templates, run <code>bin/update</code> from your local install and answer <code>y</code> when asked if you would also like to update <code>cbc.yml</code>. If you skipped the <code>cbc.yml</code> export prompt, run <code>bin/export</code> afterwards and copy the contents of the resulting <code>cbc.yml</code>.</li>
    </ol>
  </li>
  <li>Open a browser and navigate to your Home Assistant dashboard.</li>
  <li>Click the three dots in the top right corner and choose <code>Edit Dashboard</code>.</li>
  <li>Click three dots again and choose <code>Raw Configuration Editor</code>.</li>
  <li>Highlight all of the existing content of <code>button_card_templates:</code>. This will probably be from the first line to just above <code>views:</code>.</li>
  <li>Replace the highlighted text with the copied text.</li>
  <li>Click <strong>Save</strong> and close the raw configuration editor.</li>
</ol>
