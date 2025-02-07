extends Node

var money = 1000
var crystals = 0
var lrk = 0
var inventory = []
var goals = {
    "dubai_ticket": false,
    "luxury_car": false
}

func add_item(item_name, item_price):
    if money >= item_price:
        money -= item_price
        inventory.append(item_name)
    else:
        print("Недостаточно денег!")

func sell_item(item_name, sell_price):
    if item_name in inventory:
        inventory.erase(item_name)
        money += sell_price
    else:
        print("Товар не найден в инвентаре!")
