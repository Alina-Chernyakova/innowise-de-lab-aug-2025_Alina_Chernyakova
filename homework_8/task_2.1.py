#Task 1. Функции без параметров  Создайте функцию без параметров show_current_time() — печатает 
#текущие дату и время (используйте модуль datetime)

from datetime import datetime

def show_current_time(): #создаем функцию без параметров
    time=datetime.now()
    print(f"сейчас: {time}")

show_current_time()# вызываем функцию 