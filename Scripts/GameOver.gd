extends Node2D


var game_over_screen_scene = preload("res://Scenes/game_over_screen.tscn")
var game_over_screen

onready var PlayAgainNode = get_node("../PlayAgain")
onready var CalculationsNode = get_node("../Calculations")

var is_game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	is_game_over = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_over():
	game_over_screen = game_over_screen_scene.instance()
	game_over_screen.score = CalculationsNode.score
	game_over_screen.high_score = CalculationsNode.max_score
	get_parent().add_child(game_over_screen)
	game_over_screen.screen_in()
	game_over_screen.connect("btn_pressed", self, "_on_btn_pressed")
	#get_tree().paused = true

func _on_btn_pressed():
	get_tree().paused = false
	if game_over_screen != null:
		game_over_screen.screen_out()
	PlayAgainNode.PlayAgain()

func _on_ProgressBar_game_over():
	is_game_over = true
	game_over()
