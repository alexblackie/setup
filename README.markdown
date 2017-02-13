# Bootstart

Setting up computers is a pain if you're like me and reinstall your OS on a
regular basis. Additionally, keeping track of all the random things you install
over time is a challenge and can lead to frustration later on as you attempt to
get things running again and can't remember that one thing you installed last
time to make it work...

I solved this by authoring a handleful of Ansible playbooks to automate the
provisioning of my desktop machines, which you are now looking at.

## Prerequisites

These playbooks are built to support the latest release of Fedora Workstation.

Automation isn't _perfect_, so there are a couple things that need to be
installed manually first. I usually install all updates, install these packages,
then reboot and run the Ansible.

- `ansible`
- `libselinux-python`
- `python2-dnf`

## Running

This is a pretty standard Ansible project, so running is quite simple:

```
$ ansible-playbook master.yml
```

If you don't already have passwordless `sudo` configured, you may need to prime
it beforehand as root access is required for some playbooks (it will `become`
when necessary).

## License

See [LICENSE](./LICENSE).
