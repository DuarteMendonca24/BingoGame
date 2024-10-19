extends Node

@onready var bingo_card: Node2D = $BingoCard

var card := []
var number_called := 0

func _ready() -> void:
	card = bingo_card.card
	print("game manager",card)
	


func _on_number_caller_number_called(number) -> void:
	number_called = number
	search_card()
	print(number_called)
	

func search_card():
	for row in card:
		if(row.has(number_called)):
			var index = row.find(number_called)
			row[index] = "X"
			bingo_card.display_card(card)
			print(card)	
			print("number found")
