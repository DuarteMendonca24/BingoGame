extends Node2D

signal number_called(number)

var rng = RandomNumberGenerator.new()

var numbers_called := []

var bingo_ball = preload("res://scenes/bingo_ball.tscn")
var balls_instantiaed := []

@onready var spawn_marker: Marker2D = $TubeSprite/SpawnMarker

func _on_timer_timeout() -> void:
	number_call()

#Function that generates an unique random number
func number_call():
	var random_number = rng.randi_range(1, 75)
	
	while numbers_called.has(random_number):
		random_number = rng.randi_range(1, 75)
	
	numbers_called.append(random_number)
	number_called.emit(random_number) #Emit the signal to the game manager script know the number called
	ball_instantiate(random_number)

#Function that instantiates a bingo ball scene
func ball_instantiate(random_number) -> void:
	var ball = bingo_ball.instantiate()
	$TubeSprite.add_child(ball)
	ball.scale = Vector2(1.7, 1.7)
	ball.set_ball_properties(random_number)
	ball.position = spawn_marker.position
	
	balls_instantiaed.append(ball)
	
	ball.connect("ball_collision",_on_ball_collision) #Connects the signal from bingo_ball to detect collisions

#Function called when balls collide to delete excess balls in the tube
func _on_ball_collision():
	if(balls_instantiaed.size() > 3):
		balls_instantiaed[0].queue_free()
		balls_instantiaed.remove_at(0)
