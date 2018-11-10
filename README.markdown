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

  - On **Fedora Workstation** you must first install `ansible`, `python2-dnf`,
    and `libselinux-python` before running.
  - On **Ubuntu**, just install `ansible`.
  - On **MacOS**, you'll need to:
    - Install XCode CLI tools: `xcode-select --install`
    - Install homebrew
    - Install `ansible` through `brew` or `pip`.

## Running

Run these playbooks as an unprivileged user (with `sudo` access). Pass
`--ask-become-pass` to have Ansible prompt for `sudo` authentication before
running.

```
$ ansible-playbook --ask-become-pass fedora.yml
```

There are a few playbooks available currently for various targets:

  - `fedora.yml` for Fedora Workstation installs
  - `fedora-kde.yml` for Fedora Workstation KDE Spin installs
  - `ubuntu.yml` for Ubuntu Desktop installs
  - `ubuntu-headless.yml` for Ubuntu Server or VM installs.
  - `macos.yml` for Macintosh computers.

Additionally, there is a utility playbook: `intel_graphics.yml`, which installs
the `libva` hardware acceleration drivers, allowing H.264 offload among other
things in various video players. This playbook is only for Linux, and currently
specifically only for Fedora.

## Known Problems

There appears to be a weird bug when using Mitogen, where `become_user` on a
localhost run will cause permission errors because it tries to `os.chdir` to the
directory where Ansible is running -- which, for this repo, is likely within
your home directory (which an unprivileged user can't read). Therefore, it's
encouraged to disable Mitogen when running these playbooks until a workaround or
fix is found.

## License

See [LICENSE](./LICENSE).
