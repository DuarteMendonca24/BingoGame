extends Node2D

@onready var grid_container: GridContainer = $GridContainer
var rng = RandomNumberGenerator.new()

var  card_dict = {
	"B": [],
	"I": [],
	"N": [],
	"G": [],
	"O": [],
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_dict["B"] = random_row(1,15)
	card_dict["I"] = random_row(16,30)
	card_dict["N"] = random_row(31,45)
	card_dict["G"] = random_row(46,60)
	card_dict["O"] = random_row(61,75)
	for key in card_dict:
		print(card_dict[key])
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func random_row(min,max):
	var row_array = []
	var random_number = 0
	while row_array.size() < 5:
		random_number = rng.randi_range(min,max)
		if(!row_array.has(random_number)):
			row_array.append(random_number)
	return row_array
