extends Node2D

@onready var bingo_grid: GridContainer = $CardSprite/BingoGrid
var rng = RandomNumberGenerator.new()

# Dictionary that holds the random columns
var  column_dict = {
	"B": [],
	"I": [],
	"N": [],
	"G": [],
	"O": [],
}

# Array to hold the bingo card numbers organized
var card = [
	[],
	[],
	[],
	[],
	[]
]

func _ready() -> void:
	
	column_dict["B"] = random_column(1,15)
	column_dict["I"] = random_column(16,30)
	column_dict["N"] = random_column(31,45)
	column_dict["G"] = random_column(46,60)
	column_dict["O"] = random_column(61,75)
	
	bingo_card(card)
	display_card(card)

# Function that generates random columns based on given numbers
func random_column(min: int,max: int):
	var row_array: Array
	var random_number: int
	while row_array.size() < 5:
		random_number = rng.randi_range(min,max)
		if(!row_array.has(random_number)):
			row_array.append(random_number)
	return row_array

# Function that fills a bingo card array with numbers from the column dictionary in order
func bingo_card(card: Array):
	for i in range(5):
		for key in ["B", "I", "N", "G", "O"]:
			card[i].append(str(column_dict[key][i]))
	card[2][2] = "X"

# Function to display the bingo card numbers into the scene
func display_card(card: Array) -> void:
	var labels:= bingo_grid.get_children() 
	var label_index:= 0	

	for row in range(5):
		for column in range(5): 
			if label_index < labels.size():
				labels[label_index].text = str(card[row][column]) 
				label_index += 1  
			else:
				print("Warning: Not enough labels!")
				return
