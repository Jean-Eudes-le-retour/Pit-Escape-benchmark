from controller import Robot
import subprocess

init = Robot()
init.__del__()

subprocess.call(["python", "pit_escape.py"])