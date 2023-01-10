import datetime
import time

while True:
    current_time = datetime.datetime.utcnow()
    current_time_formatted = current_time.strftime("%Y-%m-%d %H:%M:%S")
    with open("/log/timestamp.log", "a") as log_file:
        log_file.write(current_time_formatted + "\n")
    time.sleep(60)
