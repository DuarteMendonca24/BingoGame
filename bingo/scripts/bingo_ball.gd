extends Node2D

@onready var letter_text: Label = $Sprite2D/LetterText
@onready var number_text: Label = $Sprite2D/NumberText

func setText(number)->void:
	print("number",number)
	number_text.text = str(number)
	
	if number >= 1 and number <= 15:
		letter_text.text = "B"
	elif number >= 16 and number <= 30:
		letter_text.text = "I"
	elif number >= 31 and number <= 45:
		letter_text.text = "N"
	elif number >= 46 and number <= 60:
		letter_text.text = "G"
	elif number >= 61 and number <= 75:
		letter_text.text = "O"
		
