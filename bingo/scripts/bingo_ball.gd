extends Node2D

signal ball_collision

@export  var ball_sprite: Sprite2D
@export var letter_text: Label
@export  var number_text: Label 

# Dictionary that loads bingo ball textures based on the letter
var ball_sprite_dict = {
	"B": preload("res://textures/BingoBalls/BBall.png"),
	"I": preload("res://textures/BingoBalls/IBall.png"),
	"N": preload("res://textures/BingoBalls/NBall.png"),
	"G": preload("res://textures/BingoBalls/GBall.png"),
	"O": preload("res://textures/BingoBalls/OBall.png")
}

# Function to set bingo ball properties like text and texture
func set_ball_properties(number: int)->void:
	
	var letter: String
	
	if number >= 1 and number <= 15:
		letter = "B"
	elif number >= 16 and number <= 30:
		letter = "I"
	elif number >= 31 and number <= 45:
		letter = "N"
	elif number >= 46 and number <= 60:
		letter = "G"
	elif number >= 61 and number <= 75:
		letter = "O"
	
	letter_text.text = letter
	number_text.text = str(number)
	ball_sprite.texture = ball_sprite_dict[letter]
	

# Function to detect collision and emit a signal to number_caller script
func _on_rigid_body_2d_body_entered(body: Node) -> void:
	ball_collision.emit()
