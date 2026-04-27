---
name: Bug Report
description: File a bug report.
title: "[Bug]: "
labels: ["bug", "triage"]
assignees:
  - wfurphy
type: bug
body:
  - type: markdown
    attributes:
      value: |
        Thanks for taking the time to fill out this bug report!
  - type: textarea
    id: what-happened
    attributes:
      label: What happened?
      description: Also tell us, what did you expect to happen?
      placeholder: Tell us what you see!
      value: ""
    validations:
      required: true
  - type: dropdown
    id: version
    attributes:
      label: Version
      description: What version of our software are you running?
      options:
        - 0.2.*
        - 0.3.*
      default: 0
    validations:
      required: true

  - type: dropdown
    id: browsers
    attributes:
      label: What browsers are you seeing the problem on?
      multiple: true
      options:
        - Firefox Desktop
        - Firefox Mobile
        - Chrome/Chromium Desktop
        - Chrome/Chromium Mobile
        - Safari Desktop
        - Safari Mobile
        - Microsoft Edge
        - Other Desktop
        - Other Mobile
  - type: textarea
    id: yaml
    attributes:
      label: Template YAML
      description: Please copy and paste the yaml you used to create your template if relevant. Be careful to remove any info that should remain private like `entity_id`'s, usernames, or passwords. This will be automatically formatted into code, so no need for backticks.
      render: yaml
  - type: textarea
    id: logs
    attributes:
      label: Relevant log/console output
      description: Please copy and paste any relevant log/console output. Be careful to remove any info that should remain private like `entity_id`'s, usernames, or passwords. This will be automatically formatted into code, so no need for backticks.
      render: javascript
  - type: upload
    id: screenshots
    attributes:
      label: Upload screenshots
      description: If applicable, add screenshots to help explain your problem.
    validations:
      required: false
