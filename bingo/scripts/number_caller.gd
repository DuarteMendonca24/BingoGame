extends Node2D

signal number_called(number)

var rng = RandomNumberGenerator.new()
var numbers_called := []
var bingo_ball = preload("res://scenes/bingo_ball.tscn")
#small ball scale 0.107
var balls_instantiaed := []

#@onready var ball_positions: Node = $Sprite2D/BallPositions

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
	
	
	
func ball_instantiate(random_number) -> void:
	var ball = bingo_ball.instantiate()
	$Sprite2D.add_child(ball)
	ball.scale = Vector2(1.7, 1.7)
	ball.setText(random_number)
	
	# Insert the new ball at position 0
	ball.position = positions[0]
	balls_instantiaed.append(ball)
	
	ball.connect("ball_collision",_on_ball_collision)
	
	
	
	
	# Now, push all other balls to the next position (back to front)
	#for i in range(balls_instantiaed.size() - 1, 0, -1):  # Start from the last ball and move backward
	#	balls_instantiaed[i].position = positions[i]
	
	#print("Ball positions:", balls_instantiaed.map(func(ball): return ball.position))


func _on_ball_collision():
	print("NUmber CALler ball collision")
	if(balls_instantiaed.size() > 3):
		balls_instantiaed[0].queue_free()
		balls_instantiaed.remove_at(0)



func _on_timer_timeout() -> void:
	number_call()
