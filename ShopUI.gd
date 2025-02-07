extends Control

@onready var money_label = $MoneyLabel
@onready var crystals_label = $CrystalsLabel
@onready var message_label = $MessageLabel
@onready var item_list = $ItemList  # ItemList для отображения товаров

var items = [
    {"name": "Карандаш", "price": 10},
    {"name": "Ручка", "price": 50},
    {"name": "Корректор", "price": 100},
    {"name": "Зарядный провод", "price": 500},
    {"name": "Флешка", "price": 1000}
]

func _ready():
    update_ui()
    populate_item_list()

func update_ui():
    money_label.text = "Деньги: " + str(PlayerData.money) + " ₽"
    crystals_label.text = "Кристаллы: " + str(PlayerData.crystals)

func show_message(message):
    message_label.text = message

func populate_item_list():
    item_list.clear()
    for item in items:
        item_list.add_item(item["name"] + " - " + str(item["price"]) + " ₽")

func _on_buy_item_button_pressed():
    var selected_item_index = item_list.get_selected_items()
    if selected_item_index.size() > 0:
        var item = items[selected_item_index[0]]
        if PlayerData.money >= item["price"]:
            PlayerData.money -= item["price"]
            PlayerData.inventory.append(item["name"])
            update_ui()
            show_message("Куплен товар: " + item["name"])
        else:
            show_message("Недостаточно денег!")
    else:
        show_message("Выберите товар!")
