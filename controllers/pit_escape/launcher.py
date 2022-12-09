from controller.wb import wb

class Initializer:
    def __init__(self):
        wb.wb_robot_init()
    def __del__(self):
        wb.wb_robot_cleanup()

init = Initializer()

import pit_escape