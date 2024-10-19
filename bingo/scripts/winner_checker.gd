extends Node2D

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func check_for_winner(card:Array):
	
	for row in card:
		if  row == ["X","X","X","X","X"]:
			label.text = "BINGO!"
			print("You win by row!")
			
		
	  # Check columns for a win
	for col in range(5):  # Assuming a 5x5 card
		if card[0][col] == "X" and card[1][col] == "X" and card[2][col] == "X" and card[3][col] == "X" and card[4][col] == "X":
			label.text = "BINGO!"
			print("You win by column!")
			
	
	# Check diagonals for a win
	if card[0][0] == "X" and card[1][1] == "X" and card[2][2] == "X" and card[3][3] == "X" and card[4][4] == "X":
		print("You win by diagonal!")
		label.text = "BINGO!"
	
	if card[4][0] == "X" and card[3][1] == "X" and card[2][2] == "X" and card[1][3] == "X" and card[0][4] == "X":
		print("You win by anti-diagonal!")
		label.text = "BINGO!"
		
