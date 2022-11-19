# `~/.bootstart`

While [my dotfiles][0] configure my development environment, that's only half
of the story. This repository contains Ansible playbooks to configure the
systems I use -- everything from headless VMs to workstation laptops.

[0]: https://github.com/alexblackie/dotfiles

## Supported Targets

There are two primary modes:

1. **Workstation** provides full coverage including GUI apps and desktop shell configuration.
2. **Headless** provides full development environment support, perfect for headless VMs.

Support varies based on the operating system:

- **Ubuntu Desktop** (LTS) and **Fedora Workstation** support **Workstation**
- **Debian** has **headless** support.
- **macOS** is **not supported** but does have its own little playbook to set
  some global preferences to make the base experience less ass.

## Running

Run these playbooks as an unprivileged user. If `sudo` password authentication
is needed, pass `--ask-become-pass` to have Ansible prompt for authentication
before it begins.

```
$ ansible-playbook --ask-become-pass playbooks/workstation.yml
```

## License

See [LICENSE](./LICENSE).
