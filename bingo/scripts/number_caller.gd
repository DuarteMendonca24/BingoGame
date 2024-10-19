extends Node2D

signal number_called(number)

var rng = RandomNumberGenerator.new()
var numbers_called := []
@onready var label: Label = $Label

func number_call():
	var random_number = rng.randi_range(1, 75)
	
	# Keep generating a number until it's unique
	while numbers_called.has(random_number):
		random_number = rng.randi_range(1, 75)
	
	# Once we have a unique number, add it to the list and update the label
	numbers_called.append(random_number)
	label.text = str(random_number)
	number_called.emit(random_number)


func _on_timer_timeout() -> void:
	number_call()
