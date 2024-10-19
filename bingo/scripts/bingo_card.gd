extends Node2D

var rng = RandomNumberGenerator.new()
@onready var bingo_grid: GridContainer = $BingoGrid

var  card_dict = {
	"B": [],
	"I": [],
	"N": [],
	"G": [],
	"O": [],
}

var final_card = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_dict["B"] = random_row(1,15)
	card_dict["I"] = random_row(16,30)
	card_dict["N"] = random_row(31,45)
	card_dict["G"] = random_row(46,60)
	card_dict["O"] = random_row(61,75)
	for key in card_dict:
		print(card_dict[key])
	final_card = bingo_card()
	print(final_card)
	display_card()
	


func random_row(min: int,max: int):
	var row_array = []
	var random_number = 0
	while row_array.size() < 5:
		random_number = rng.randi_range(min,max)
		if(!row_array.has(random_number)):
			row_array.append(random_number)
	return row_array
	
func bingo_card():
	var final_array = []
	for i in range(5):
	# Loop through each key in the dictionary (B, I, N, G, O)
		for key in ["B", "I", "N", "G", "O"]:
			final_array.append(card_dict[key][i])  # Add the element to final array
	return final_array
	
func display_card():
	# Ensure both the labels and final_card numbers are aligned by using a single loop
	var labels = bingo_grid.get_children()  # Get all the labels in the grid container
	for i in range(labels.size()):  # Assuming the number of labels matches the final_card
		labels[i].text = str(final_card[i])  # Set each label's text to the corresponding number
