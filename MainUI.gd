extends Control

@onready var message_label = $MessageLabel
@onready var shop_ui = $ShopUI
@onready var stock_market_ui = $StockMarketUI
@onready var inventory_ui = $InventoryUI

func _ready():
    shop_ui.visible = false
    stock_market_ui.visible = false
    inventory_ui.visible = false

func show_message(message):
    message_label.text = message

func _on_shop_button_pressed():
    shop_ui.visible = true
    stock_market_ui.visible = false
    inventory_ui.visible = false
    show_message("Онлайн-магазин открыт")

func _on_stock_market_button_pressed():
    stock_market_ui.visible = true
    shop_ui.visible = false
    inventory_ui.visible = false
    show_message("Биржа открыта")

func _on_inventory_button_pressed():
    inventory_ui.visible = true
    shop_ui.visible = false
    stock_market_ui.visible = false
    show_message("Инвентарь открыт")
    inventory_ui.update_ui()
