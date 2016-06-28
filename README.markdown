# Bootstart

I reinstall my operating system more than any sane person ever should. As a
consequence, I have become very good at regularly backing up my data and
manually setting up my development environment.

However, I've become tired of setting up my computer so often. Instead of
solving the real problem by just not reinstalling my OS so damn often, I instead
decided to put together a set of Ansible playbooks to set everything up for me.

## Prerequisites

Automation isn't _perfect_, so there are a couple things that need to be
installed manually first. I usually install all updates, install these packages,
then reboot and run the Ansible.

- `ansible`
- `libselinux-python`
- `python2-dnf`

## License

See [LICENSE](./LICENSE).
