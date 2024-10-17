extends Node2D

var rng = RandomNumberGenerator.new()
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	number_call()


func number_call():
	var random_number = rng.randi_range(1,75)
	label.text = str(random_number)
