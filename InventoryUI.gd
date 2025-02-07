extends Control

@onready var inventory_list = $InventoryList
@onready var message_label = $MessageLabel

func update_ui():
    inventory_list.clear()
    for item in PlayerData.inventory:
        inventory_list.add_item(item)

func show_message(message):
    message_label.text = message

func _on_sell_item_button_pressed(item_name):
    var sell_price = get_item_sell_price(item_name)
    if sell_price > 0:
        PlayerData.sell_item(item_name, sell_price)
        update_ui()
        show_message("Продано: " + item_name + " за " + str(sell_price) + " ₽")
    else:
        show_message("Не удалось продать товар")

func get_item_sell_price(item_name):
    # Возвращает половину стоимости товара
    match item_name:
        "Яблоки":
            return 7  # Половина от 15
        "Рыба":
            return 35  # Половина от 70
        "Инструменты":
            return 65  # Половина от 130
        _:
            return 0
