# Bootstart

This is a repository of Ansible playbooks and roles that configure my laptops
and workstations.

## Prerequisites

These playbooks support only the latest releases of:

  - Fedora Workstation
  - RedHat Enterprise Linux Workstation
  - CentOS

There are a few manual steps required on each of these platforms. First, install
all available updates and reboot; once updated:

  - On **Fedora Workstation** you must first install `ansible`, `python2-dnf`,
    and `libselinux-python` before running.
  - On **RedHat Enterprise Linux Workstation** you must first enable a handful
    of repositories. In brief,
       1. `subscription-manager repos --enable rhel-7-workstation-optional-rpms`
       2. `subscription-manager repos --enable rhel-7-workstation-extras-rpms`
       3. `yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm`
  - On **CentOS**, all you need is to install `epel-release`.

## Running

Run these playbooks as an unprivileged user (with `sudo` access). Pass
`--ask-become-pass` to have Ansible prompt for `sudo` authentication before
running.

```
$ ansible-playbook --ask-become-pass fedora.yml
```

There are two playbooks available currently:

  1. `fedora.yml` for Fedora Workstation installs, and
  2. `rhel.yml` for RedHat Enterprise Linux Workstation and CentOS installs.

## License

See [LICENSE](./LICENSE).
