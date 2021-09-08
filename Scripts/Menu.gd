extends Control

signal btn_pressed


#var score = 0
var high_score = 0

func _ready():
	$ScorePanel/VBoxContainer/HighScore/HBoxContainer/VBoxContainer/Score.text = str(high_score)


func screen_out(time = 0.3):
	$Tween.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween,"tween_all_completed")
	queue_free()


func _on_Button_pressed():
	emit_signal("btn_pressed")
