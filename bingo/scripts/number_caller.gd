extends Node2D

signal number_called(number)

var rng = RandomNumberGenerator.new()
var numbers_called := []
var bingo_ball = preload("res://scenes/bingo_ball.tscn")
#small ball scale 0.107


@onready var ball_positions: Node = $Sprite2D/BallPositions

var positions := []

func _ready() -> void:
	var ball_pos_children = $Sprite2D.get_children()
	for child in ball_pos_children:
		positions.append(child.position)
	print("Positions",positions)

func number_call():
	var random_number = rng.randi_range(1, 75)
	
	# Keep generating a number until it's unique
	while numbers_called.has(random_number):
		random_number = rng.randi_range(1, 75)
	
	# Once we have a unique number, add it to the list and update the label
	numbers_called.append(random_number)
	number_called.emit(random_number)
	ball_instantiate(random_number)
	
func ball_instantiate(random_number)->void:
	var ball = bingo_ball.instantiate()
	$Sprite2D.add_child(ball)

	ball.setText(random_number)
	ball.position = positions[0]
	ball.scale = Vector2(1.7,1.7)
	print("Ball pos",ball.position)
	



func _on_timer_timeout() -> void:
	number_call()
