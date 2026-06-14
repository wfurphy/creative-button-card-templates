# Customisation

## Changes and Custom Cards

> :warning: DO NOT MAKE CHANGES TO THE ORIGINAL TEMPLATES. There's no support for that, your changes will be lost if you update and everyone will be unhappy campers. There's a better way...

If you wish to change or expand on one of the templates you can create a new file under `custom/yourcardname.yaml` and it will be picked up and loaded with the rest or in Storage mode (UI) it will be exported with `bin/export` into `cbc.yml` ready to COPY-PASTE with the rest. Obviously, replace _yourcardname_ with your card name and make it unique. __It cannot be the same as an existing template name, that WILL end in tears!__ :sob:

Let's say I wanted to make a transparent light card which always has the brightness strip showing with certain settings so I don't have to put them in each time. I could make the following `custom/showy_light.yaml`:

```yaml
showy_light:
  template:
    - light
    - transparent
  variables:
   show:
      brightness_strip: true
    strip_show:
      icon: true
      step_value: false
      fade: true
```

Then when I'm placing the lights in the dashboard:

```yaml
- type: custom:button-card
  template: showy_light
  entity: light.lamp
  # ..
```

You're not limited to `variables` you can override any other property from the template with your own. If you wanted to get really advanced you can copy properties or the entire contents from `light.yaml` and copy it to `custom/showy_light.yaml` and then change the appropriate ones.

> 🙋‍♂️ __If you do this, make sure you change the template name (eg. `light:` to `showy_light:`) or else the tears :sob: again!__

My **strong** suggestion is to use the method of loading the template and overriding only what you need to change though because they can get a tad complicated especially when you consider the inherited templates. If you're comfortable with YAML and (poorly-written, buttoncardworkaroundesque) Javascript then you should be fine with whatever you find.

Include any templates and addons you want in your customs or make them from scratch! Just have fun and be CREATIVE with them!
