extends Control

var points = []  # Массив для хранения точек графика

func _ready():
    clear_points()  # Очищаем график при запуске

func clear_points():
    points = []  # Очищаем массив точек
    queue_redraw()  # Перерисовываем график

func add_point(price):
    points.append(price)  # Добавляем новую точку
    queue_redraw()  # Перерисовываем график

func _draw():
    if points.size() < 2:
        return  # Не рисуем, если точек меньше двух

    var max_price = points.max()  # Максимальная цена
    var min_price = points.min()  # Минимальная цена
    var range_price = max_price - min_price  # Разница между максимальной и минимальной ценой
    if range_price == 0:
        range_price = 1  # Чтобы избежать деления на ноль

    var step_x = size.x / (points.size() - 1)  # Шаг по оси X
    var step_y = size.y / range_price  # Шаг по оси Y

    # Рисуем линии между точками
    for i in range(points.size() - 1):
        var x1 = i * step_x
        var y1 = size.y - (points[i] - min_price) * step_y
        var x2 = (i + 1) * step_x
        var y2 = size.y - (points[i + 1] - min_price) * step_y
        draw_line(Vector2(x1, y1), Vector2(x2, y2), Color(1, 1, 1), 2)  # Белая линия толщиной 2 пикселя
