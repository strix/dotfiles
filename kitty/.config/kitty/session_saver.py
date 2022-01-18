import argparse
import collections
import os
import os.path
import sys

import json # TEMPORARY

from kitty.constants import config_dir


# TODO figure out a different way to handle this so it's not at the outermost
# scope
opts = {
    'session_name': None
}

def get_session_path(path_root=config_dir):
    return '{}/kitty_sessions'.format(path_root)

def session_file_path(session_name):
    filename = get_session_path() + '/{}'.format(session_name)
    return filename

def lister_handler(args):
    if len(args.session) != 0:
        print('Listing individual sessions is not yet implemented. Listing all...')
    sessions = [f for f in os.listdir(get_session_path()) if
                os.path.isfile(os.path.join(get_session_path(), f))]
    if len(sessions) == 0:
        print('no saved sessions')
    print('\n'.join(sessions))

def save_handler(args):
    session_name = args.session
    if not session_name:
        session_name = input('Session name: ')
    filename = session_file_path(session_name)
    if os.path.isfile(filename):
        answer = input('The session ' + session_name + ' already exists. Do you wish to overwrite it? (y/N) ')
        if answer.lower() != 'y':
            quit()
    opts['session_name'] = session_name

def delete_handler(args):
    filename = session_file_path(args.session)
    if not os.path.isfile(filename):
        print('The session ' + args.session + ' does not exist.')
        quit()
    answer = input('Are you sure you want to delete session: ' + args.session + ' ? (y/N) ')
    if answer.lower() != 'y':
        quit()
    os.remove(filename)

def get_focused_window_id(windows, target_window_id):
    focused_window_id = None
    for w in windows:
        if w.is_active and w.overlay_for == target_window_id:
            focused_window_id = w.overlay_for
            break
    return focused_window_id

# For some reason having an overlay window messes up the order so we
# sort them back into their original order
def sort_windows(windows):
    swap_indices = []
    for idx, w1 in enumerate(windows):
        for idy, w2 in enumerate(windows):
            if w1.overlay_for == w2.id and w1.id == w2.overlay_window_id:
                swaps = (idx, idy)
                if not any(swaps[0] in i for i in swap_indices) and not any(swaps[1] in i for i in swap_indices):
                    swap_indices.append(swaps)

    windows_as_list = list(collections.deque(windows))
    for i, j in swap_indices:
        windows_as_list[i], windows_as_list[j] = windows_as_list[j], windows_as_list[i]

    return windows_as_list

def main(args):
    os.makedirs(get_session_path(), exist_ok=True)
    parser = argparse.ArgumentParser(description='Manage kitty sessions')
    subparsers = parser.add_subparsers(dest='command')
    lister = subparsers.add_parser('list', help='list session(s)')
    lister.set_defaults(func=lister_handler)
    lister.add_argument(
        'session',
        help='the session(s) you want more info on',
        default=None,
        nargs='*'
    )
    save = subparsers.add_parser('save', help='save session')
    save.set_defaults(func=save_handler)
    save.add_argument(
        'session',
        help='the name of the session you wish to save',
        default=None,
        nargs='?'
    )
    delete = subparsers.add_parser('delete', help='delete session')
    delete.set_defaults(func=delete_handler)
    delete.add_argument(
        'session',
        help='the name of the session you wish to delete',
        default=None,
    )
    args = parser.parse_args(args[1:])
    args.func(args)

    return opts

def handle_result(args, data, target_window_id, boss):
    #  sys.stdout.write('hey')
    if data['session_name'] is None:
        quit()

    save_path = '{}/kitty_sessions/{}'.format(config_dir, data['session_name'])

    cmds = []
    for tab in boss.all_tabs:
        new_tab = 'new_tab'
        if tab.name:
            new_tab += ' ' + tab.name
        cmds.append(new_tab)
        enabled_layouts = 'enabled_layouts ' + ', '.join(tab.enabled_layouts)
        cmds.append(enabled_layouts)
        layout = 'layout ' + tab.current_layout.name
        cmds.append(layout)

        #  focused_window_id = get_focused_window_id(tab.windows, target_window_id)
        #  sorted_windows = sort_windows(tab.windows)

        #  sorted_filtered_windows = [w for w in sorted_windows if w.overlay_for is None]

        #  for w in sorted_filtered_windows:
        non_overlay_windows = [ w for w in tab.windows if 'session_saver.py'
                               not in w.as_dict()['cmdline'] ]
        for w in non_overlay_windows:
            wdict = w.as_dict()
            del wdict['env']
            window_cwd = 'cd ' + wdict['cwd']
            cmds.append(window_cwd)
            if w.override_title:
                window_title = 'title ' + w.override_title
                cmds.append(window_title)
            #  if w.is_active or w.id == focused_window_id:
            if w.id == target_window_id:
                cmds.append('focus')
            launch_cmd = 'launch ' + os.environ.get('SHELL', 'zsh')
            cmds.append(launch_cmd)

    os.makedirs(os.path.dirname(save_path), exist_ok=True)

    with open(save_path, 'w') as writer:
        writer.write('\n'.join(cmds))
