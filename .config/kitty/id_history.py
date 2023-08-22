import os
from typing import List
from kitty.boss import Boss

def main(args: List[str]) -> str:
    # this is the main entry point of the kitten, it will be executed in
    # the overlay window when the kitten is launched
    #answer = input('Enter some text: ')
    # whatever this function returns will be available in the
    # handle_result() function
    window_id = "0"
    # get the last accessed window id
    id_file = os.path.expanduser('~') + '/.config/kitty/last_window_id.txt'
    f = open(id_file, "r")
    if f is not None:
        window_id = f.read()

    return window_id 

def handle_result(args: List[str], answer: str, target_window_id: int, boss: Boss) -> None:
    # get the kitty window into which to paste answer
    w = boss.window_id_map.get(target_window_id)
    if w is not None and answer != "0" and answer != target_window_id:
        with open(os.path.expanduser('~') + '/.config/kitty/last_window_id.txt', 'w') as id_file:
            id_file.write(str(target_window_id))
        #boss.call_remote_control(w, ('focus-tab', '--match=title:core'))
        if args[1] == "last_window":
            boss.call_remote_control(w, ('focus-tab', f'--match=id:{answer}'))
        #boss.call_remote_control(w, ('focus-tab', '--match=id:5'))
        #boss.call_remote_control(w, ('send-text', f'--match=id:{w.id}', 'here'))
