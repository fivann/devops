import pyautogui
import time

try:
    while True:
        x, y = pyautogui.position()  # Получение координат курсора
        position_str = 'X: {}, Y: {}'.format(x, y)
        print(position_str, end='\r')  # Вывод координат курсора в реальном времени
        time.sleep(0.1)  # Задержка на 100 миллисекунд, чтобы снизить нагрузку на процессор
except KeyboardInterrupt:
    print('\nПрограмма завершена.')
