# Bootstart

This is a repository of Ansible playbooks and roles that configure my laptops
and workstations.

## Prerequisites

These playbooks support only the latest releases of:

  - Fedora Workstation
  - Ubuntu (LTS)

Most tasks will probably work on RHEL/CentOS, but that is not tested nor
officially supported.

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
