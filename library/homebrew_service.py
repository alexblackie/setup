#!/usr/bin/python

# (c) 2018, Alex Blackie <alex@blackieops.com>
# GNU General Public License v3.0+ (see https://www.gnu.org/licenses/gpl-3.0.txt)

from subprocess import check_output
from ansible.module_utils.basic import *

TENSE_MATRIX = {
    'started': 'start',
    'restarted': 'restart',
    'stopped': 'stop',
    'run': 'run'
}

BREW_PATH = '/usr/local/bin/brew'

def main():
    changed = True
    module = AnsibleModule(argument_spec=dict(
        state=dict(required=True, choices=['started', 'restarted', 'stopped']),
        name=dict(required=True, type='str'),
        enabled=dict(default=False, type='bool')
    ))

    if module.params['enabled'] is False:
        # homebrew will enable a service at boot if you call 'start', so if we
        # didn't request this service to be enabled, we have to translate
        # 'start' to 'run', which will just start it for the current session.
        module.params['state'] = 'run'

    action = TENSE_MATRIX.get(module.params['state'])
    stdout = check_output([BREW_PATH, 'services', action, module.params['name']])

    if 'already started' in stdout:
        changed = False
    if 'already stopped' in stdout:
        changed = False

    module.exit_json(changed=changed)

if __name__ == '__main__':
    main()
