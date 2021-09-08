extends Control

signal btn_pressed
signal new_high_score
signal old_high_score

onready var PlayServices = get_node("/root/GPlay")

var score = 0
var high_score = 0

func _ready():
	visible = false
	modulate = Color(1,1,1,0)
	if score >= high_score:
		emit_signal("new_high_score")
		$GameOverPanel.visible = false
		$GameOverPanel_NewScore.visible = true
		$GameOverPanel_NewScore/HighScore.text = str(score)
	else:
		emit_signal("old_high_score")
		$GameOverPanel.visible = true
		$GameOverPanel_NewScore.visible = false
		$GameOverPanel/VBoxContainer/HighScore/HBoxContainer/VBoxContainer/Score.text = str(high_score)
		$GameOverPanel/VBoxContainer/CurrentScore.text = str(score)


func screen_in():
	visible = true
	$Tween.interpolate_property(self, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	

func screen_out(time = 0.3):
	$Tween.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween,"tween_all_completed")
	queue_free()


func _on_Button_pressed():
	emit_signal("btn_pressed")


func _on_Button2_pressed():
	PlayServices.show_leaderboard()
