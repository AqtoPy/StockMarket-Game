extends Control

@onready var money_label = $MoneyLabel
@onready var crystals_label = $CrystalsLabel
@onready var message_label = $MessageLabel

func _ready():
    update_ui()

func update_ui():
    money_label.text = "Деньги: " + str(PlayerData.money) + " ₽"
    crystals_label.text = "Кристаллы: " + str(PlayerData.crystals)

func show_message(message):
    message_label.text = message

func _on_buy_item_button_pressed(item_name, item_price):
    if PlayerData.money >= item_price:
        PlayerData.add_item(item_name, item_price)
        update_ui()
        show_message("Куплен товар: " + item_name)
    else:
        show_message("Недостаточно денег!")

func _on_buy_upgrade_button_pressed(upgrade_cost):
    if PlayerData.crystals >= upgrade_cost:
        PlayerData.crystals -= upgrade_cost
        show_message("Улучшение куплено!")
        update_ui()
    else:
        show_message("Недостаточно кристаллов!")
