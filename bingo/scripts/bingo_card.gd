extends Node2D

var rng = RandomNumberGenerator.new()
@onready var bingo_grid: GridContainer = $BingoGrid

var  column_dict = {
	"B": [],
	"I": [],
	"N": [],
	"G": [],
	"O": [],
}

var card = [
	[],
	[],
	[],
	[],
	[]
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	column_dict["B"] = random_column(1,15)
	column_dict["I"] = random_column(16,30)
	column_dict["N"] = random_column(31,45)
	column_dict["G"] = random_column(46,60)
	column_dict["O"] = random_column(61,75)

	bingo_card(card)
	display_card(card)

func random_column(min: int,max: int):
	var row_array = []
	var random_number = 0
	while row_array.size() < 5:
		random_number = rng.randi_range(min,max)
		if(!row_array.has(random_number)):
			row_array.append(random_number)
	return row_array
	
func bingo_card(card:Array):
	for i in range(5):
	# Loop through each key in the dictionary (B, I, N, G, O)
		for key in ["B", "I", "N", "G", "O"]:
			card[i].append(str(column_dict[key][i]))
			#print("card test",card)
	card[2][2] = "X"
	
func display_card(card: Array):
	var labels = bingo_grid.get_children()  # Get all the labels in the grid container
	var label_index = 0  # Track the current label index

	# Loop through the 2D array (column-major order) to display the numbers
	for row in range(5):  # Iterate over columns B, I, N, G, O
		for column in range(5):  # Iterate over each row in the column
			if label_index < labels.size():  # Ensure we don't exceed the number of labels
				labels[label_index].text = str(card[row][column])  # Set the label's text to the corresponding number
				label_index += 1  # Move to the next label
			else:
				print("Warning: More labels needed in the grid!")
				return  # Exit if we exceed the number of labels
