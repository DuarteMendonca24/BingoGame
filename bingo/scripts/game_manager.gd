extends Node

@onready var bingo_card: Node2D = $BingoCard
@onready var winner_checker: Node2D = $WinnerChecker

var card := []

func _ready() -> void:
	card = bingo_card.card # Assigns the card property from the bingo_card node to the local card variable

# Signal function emited by number caller script when a number is called
func _on_number_caller_number_called(number) -> void:
	search_card(str(number)) # Convert to string because the card array holds strings

# Function that searches the bingo card for the number called
func search_card(number_called: String):
	for row in card:
		if(row.has(number_called)):
			var index = row.find(number_called)
			row[index] = "X"
			bingo_card.display_card(card)
			winner_checker.check_for_winner(card)
