extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func PlayScoreGainAnimation():
	var animation = $AnimationPlayer.get_animation("ScoreGain")
	animation.track_set_key_value(0,0, position)
	animation.track_set_key_value(0,1, position + Vector2(100,-50))
	$AnimationPlayer.play("ScoreGain")
	#yield($AnimationPlayer, "animation_finished")
	#queue_free()
	

func PlayScoreLoseAnimation():
	$Label.text = "-1"
	$Label.get("custom_fonts/font").outline_color = Color("dd0303")
	var animation = $AnimationPlayer.get_animation("ScoreLose")
	animation.track_set_key_value(0,0, position)
	animation.track_set_key_value(0,1, position + Vector2(-100,-50))
	$AnimationPlayer.play("ScoreLose")
	#yield($AnimationPlayer, "animation_finished")
	#queue_free()
