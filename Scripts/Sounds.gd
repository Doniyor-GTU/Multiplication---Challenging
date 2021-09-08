extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var vol = -15
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CheckButton_pressed():
	SoundManager.play_fixed_sound("click2")


func _on_Button1_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button2_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button3_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button4_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button5_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button6_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button7_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button8_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button9_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button10_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button11_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Button12_pressed():
	SoundManager.play_fixed_sound("click", vol)


func _on_Calculations_correct_answer():
	SoundManager.play_fixed_sound("correct", -10)


func _on_Calculations_wrong_answer():
	SoundManager.play_fixed_sound("incorrect", -10)


func _on_ProgressBar_heart_lose():
	SoundManager.play_fixed_sound("heartLose", -10)


