extends ProgressBar

signal game_over
signal heart_lose

# in seconds
export var initial_time = 30


onready var CalculationsNode = get_node("../Calculations")

var time = 30 setget set_time, get_time
var min_time = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	time = initial_time
	start_progress()
	#value = 100
	#$Timer.start()

func start_progress():
	stop_progress()
	value = 100
	$Tween.interpolate_property(self, "value", value, 0, time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()

func stop_progress():
	$Tween.stop_all()

func set_min_time(wrt_var):
	if wrt_var <= 10:
		min_time = 10
	elif wrt_var <= 15:
		min_time = 8
	elif wrt_var <= 20:
		min_time = 6
	elif wrt_var <= 30:
		min_time = 5
	elif wrt_var <= 40:
		min_time = 4
	elif wrt_var <= 80:
		min_time = 3
	else:
		min_time = 2

func set_time(new_value):
	set_min_time(CalculationsNode.score)
	if time > min_time:
		time = new_value
		print(time)

func get_time():
	return time

#
#func _on_Timer_timeout():
#	var val = 50/time
#	value -= val
#	if value <= 0:
#		if CalculationsNode.hearts == 1:
#			$Timer.stop()
#			emit_signal("game_over")
#		elif CalculationsNode.hearts > 1:
#			value = 100
#			emit_signal("heart_lose")


func _on_Tween_tween_completed(object, key):
	if value == 0:
		if CalculationsNode.hearts == 0:
			#$Timer.stop()
			emit_signal("game_over")
		elif CalculationsNode.hearts > 0:
			time += 2
			start_progress()
			emit_signal("heart_lose")
