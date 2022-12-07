from controller import Robot
import subprocess

init = Robot()
init.__del__()

def _print_stdout(process):
    realtime_output = process.stdout.readline()
    if realtime_output:
        print(realtime_output.strip())
    return realtime_output

controller = subprocess.Popen(
    ["python", "pit_escape.py"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    encoding='utf-8'
)

while controller.poll() is None:
    _print_stdout(controller)