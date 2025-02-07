extends Control

@onready var lrk_price_label = $LRKPriceLabel
@onready var money_label = $MoneyLabel
@onready var lrk_label = $LRKLabel
@onready var price_chart = $PriceChart
@onready var message_label = $MessageLabel

func _ready():
    price_history.append(lrk_price)
    update_ui()

func _process(delta):
    timer += delta
    if timer >= price_change_interval:
        update_price()
        timer = 0

func update_ui():
    lrk_price_label.text = "Цена LRK: " + str(StockMarket.lrk_price) + " ₽"
    money_label.text = "Деньги: " + str(PlayerData.money) + " ₽"
    lrk_label.text = "LRK: " + str(PlayerData.lrk)
    update_price_chart()

func show_message(message):
    message_label.text = message

func update_price_chart():
    var change_percent = randf_range(-0.1, 0.1)
    lrk_price += lrk_price * change_percent
    lrk_price = max(lrk_price, 10)
    price_history.append(lrk_price)
    print("Новая цена LRK: ", lrk_price, " ₽")

func _on_buy_lrk_button_pressed(amount):
    StockMarket.buy_lrk(amount, PlayerData)
    update_ui()
    show_message("Куплено " + str(amount) + " LRK за " + str(amount * StockMarket.lrk_price) + " ₽")

func _on_sell_lrk_button_pressed(amount):
    StockMarket.sell_lrk(amount, PlayerData)
    update_ui()
    show_message("Продано " + str(amount) + " LRK за " + str(amount * StockMarket.lrk_price) + " ₽")
