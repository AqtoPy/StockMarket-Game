extends Node

var lrk_price = 100
var price_history = []
var price_change_interval = 300
var timer = 0

func _ready():
    price_history.append(lrk_price)

func _process(delta):
    timer += delta
    if timer >= price_change_interval:
        update_price()
        timer = 0

func update_price():
    var change_percent = randf_range(-0.1, 0.1)
    lrk_price += lrk_price * change_percent
    lrk_price = max(lrk_price, 10)
    price_history.append(lrk_price)
    print("Новая цена LRK: ", lrk_price, " ₽")

func buy_lrk(amount, player):
    var total_cost = amount * lrk_price
    if player.money >= total_cost:
        player.money -= total_cost
        player.lrk += amount
        print("Куплено ", amount, " LRK за ", total_cost, " ₽")
    else:
        print("Недостаточно денег!")

func sell_lrk(amount, player):
    if player.lrk >= amount:
        var total_income = amount * lrk_price
        player.money += total_income
        player.lrk -= amount
        print("Продано ", amount, " LRK за ", total_income, " ₽")
    else:
        print("Недостаточно LRK!")
