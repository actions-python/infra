# GitHub Actions Python Infra

![OpenTofu Badge](https://badgen.net/badge/icon/opentofu/yellow?icon=https://github.com/opentofu/brand-artifacts/raw/main/symbol-only/transparent/SVG/on-dark-mono.svg&label)
![GitHub Checks Badge](https://badgen.net/github/checks/actions-python/infra?icon=github&label)

This repository is an OpenTofu code repository which defines the infrastructure for [GitHub Actions Python](https://github.com/actions-python).

## Requirements

- OpenTofu
- Terraform Cloud Account

## Getting Started

```sh
$ tofu login app.terraform.io
OpenTofu will request an API token for app.terraform.io using your browser.

$ cd ./{workspace}

$ tofu init
Initializing Terraform Cloud...

$ tofu plan
Preparing the remote plan...
```
