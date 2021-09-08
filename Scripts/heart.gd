extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func explode():
	$heart.visible = false
	$Particles2D.emitting = true
	$Timer.start()


func _on_Timer_timeout():
	queue_free()
