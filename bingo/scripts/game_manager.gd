extends Node

@onready var bingo_card: Node2D = $BingoCard

var card := []
var number_called := 0

func _ready() -> void:
	card = bingo_card.final_card
	print(card)
	pass


func _on_number_caller_number_called(number) -> void:
	number_called = number
	search_card()
	print(number_called)
	

func search_card():
	if(card.has(number_called)):
		print("number found")
