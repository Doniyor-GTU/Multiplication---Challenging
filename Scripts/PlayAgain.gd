extends Node


onready var CalculationsNode = get_node("../Calculations")
onready var NumberGeneratorNode = get_node("../NumberGenerator")
onready var ProgressBarNode = get_node("../ProgressBar")
onready var GameOverNode = get_node("../GameOver")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func PlayAgain():
	CalculationsNode._ready()
	NumberGeneratorNode._ready()
	ProgressBarNode._ready()
	GameOverNode._ready()


