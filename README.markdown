# `~/.setup`

While [my dotfiles][0] configure my development environment, that's only half
of the story. This repository contains Ansible playbooks to configure the
systems I use -- everything from headless VMs to workstation laptops.

[0]: https://github.com/alexblackie/dotfiles

## Supported Targets

There are two primary modes:

1. **Workstation** provides full coverage including GUI apps and desktop shell configuration.
2. **Headless** provides full development environment support, perfect for headless VMs.

Support varies based on the operating system:

- **macOS** and **Fedora** have full support for all modes.
- **Debian** (stable/sid) supports **Headless**

Note that for macOS, Homebrew is required to be installed prior to the
playbook's execution.

## Running

Run these playbooks as an unprivileged user. If `sudo` password authentication
is needed, pass `--ask-become-pass` to have Ansible prompt for authentication
before it begins.

```
$ ansible-playbook --ask-become-pass workstation.yml
```

## License

See [LICENSE](./LICENSE).
