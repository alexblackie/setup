# `~/.bootstart`

While [my dotfiles][0] configure my development environment, that's only half
of the story. This repository contains Ansible playbooks to configure the
systems I use -- everything from headless VMs to workstation laptops.

Currently the supported targets are the latest releases of **macOS**, **Ubuntu
LTS**, and **Fedora Workstation**.

[0]: https://github.com/alexblackie/dotfiles

## Running

Run these playbooks as an unprivileged user. If `sudo` password authentication
is needed, pass `--ask-become-pass` to have Ansible prompt for authentication
before it begins.

```
$ ansible-playbook --ask-become-pass workstation.yml
```

There are two playbooks available:

  - `workstation.yml` for desktop/laptop workstations (GUI tools included), and
  - `headless.yml` for headless Linux installs (CLI tools only).

## License

See [LICENSE](./LICENSE).
