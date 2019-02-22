# Bootstart

This is a repository of Ansible playbooks and roles that configure my laptops
and workstations.

## Prerequisites

These playbooks support only the latest releases of:

  - Fedora Workstation
  - Ubuntu (LTS)
  - macOS

There are a few manual steps required on each of these platforms. First, install
all available updates and reboot; once updated:

  - On **Fedora Workstation** you must first install `python2-dnf`, and
    `libselinux-python` before running.
  - On **MacOS**, you'll need to:
    - Install XCode CLI tools: `xcode-select --install`
    - Install [Homebrew](https://brew.sh)

Then you can install Ansible through either your favourite package manager or
`pip`. These playbooks require at least Ansible 2.8, so you may need to install
through `pip` to ensure you have a more recent version than your distro
provides.

## Running

Run these playbooks as an unprivileged user (with `sudo` access). Pass
`--ask-become-pass` to have Ansible prompt for `sudo` authentication before
running.

```
$ ansible-playbook --ask-become-pass workstation.yml
```

There are two playbooks available:

  - `workstation.yml` for desktop/laptop workstations (GUI tools included);
  - `headless.yml` for headless Linux installs (CLI tools only).

## Known Problems

There appears to be a weird bug when using Mitogen, where `become_user` on a
localhost run will cause permission errors because it tries to `os.chdir` to the
directory where Ansible is running -- which, for this repo, is likely within
your home directory (which an unprivileged user can't read). Therefore, it's
encouraged to disable Mitogen when running these playbooks until a workaround or
fix is found.

## License

See [LICENSE](./LICENSE).
