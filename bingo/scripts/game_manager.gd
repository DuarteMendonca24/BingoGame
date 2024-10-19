extends Node

@onready var bingo_card: Node2D = $BingoCard
@onready var winner_checker: Node2D = $WinnerChecker

var card := []
var number_called := ""

func _ready() -> void:
	card = bingo_card.card
	print("game manager",card)
	

func _on_number_caller_number_called(number) -> void:
	number_called = str(number)
	search_card()
	print(number_called)
	
func search_card():
	for row in card:
		if(row.has(number_called)):
			var index = row.find(number_called)
			row[index] = "X"
			bingo_card.display_card(card)
			winner_checker.check_for_winner(card)
			print(card)	
			print("number found")
