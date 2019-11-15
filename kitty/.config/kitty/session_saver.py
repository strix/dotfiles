from kitty.constants import config_dir
import os


def printStuff(stuff):
    print('---------------START-----------------')
    print(stuff)
    print('---------------END-----------------')


def main(args):
    pass
    # this is the main entry point of the kitten, it will be executed in
    # the overlay window when the kitten is launched
    # answer = input('Enter some text: ')
    # whatever this function returns will be available in the
    # handle_result() function
    # return answer


def handle_result(args, answer, target_window_id, boss):
    # get the kitty window into which to paste answer
    # w = boss.window_id_map.get(target_window_id)
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

        for idx, w in enumerate(tab.windows):
            wdict = w.as_dict()
            del wdict['env']
            window_cwd = 'cd ' + wdict['cwd']
            cmds.append(window_cwd)
            if w.override_title:
                window_title = 'title ' + w.override_title
                cmds.append(window_title)
            if w.is_active:
                cmds.append('focus')
            launch_cmd = 'launch ' + os.environ.get('SHELL', 'zsh')
            cmds.append(launch_cmd)

    with open(config_dir + '/kitty_session', 'w') as writer:
        writer.write('\n'.join(cmds))
    # if w is not None:
        # w.paste(answer)


handle_result.no_ui = True
