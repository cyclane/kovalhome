# KovalHome automations

This repository contains any automations used in deploying *.koval.net services.

## Infra(structure)

All 'managed' infrastructure is deployed and provisioned with [Ansible](https://www.ansible.com/).
However, some 'unmanaged' (manually managed) resources also exist - primarily everything required for this repository to work (I don't want to make a dependency loop).

Ansible playbooks are ran in alphanumerical order and are expected to be idempotent.
