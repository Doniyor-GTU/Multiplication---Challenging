extends Node2D


onready var LineEditNode = get_node("../LineEdit")
onready var GameOverNode = get_node("../GameOver")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button1_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "1"


func _on_Button12_pressed():
	if !GameOverNode.is_game_over:
		var txt = LineEditNode.text
		LineEditNode.text = txt.substr(0, txt.length() - 1)


func _on_Button2_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "2"


func _on_Button3_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "3"


func _on_Button4_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "4"


func _on_Button5_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "5"


func _on_Button6_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "6"


func _on_Button7_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "7"


func _on_Button8_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "8"


func _on_Button9_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "9"


func _on_Button10_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text = ""


func _on_Button11_pressed():
	if !GameOverNode.is_game_over:
		LineEditNode.text += "0"
