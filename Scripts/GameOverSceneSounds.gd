extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pause_screen_new_high_score():
	SoundManager.play_fixed_sound("newHighScore", -5)


func _on_pause_screen_old_high_score():
	SoundManager.play_fixed_sound("fail", -10)


func _on_Button_pressed():
	SoundManager.play_fixed_sound("click2")


func _on_Button2_pressed():
	SoundManager.play_fixed_sound("click2")
