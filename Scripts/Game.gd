extends Node

var MenuScreenScene = preload("res://Scenes/Menu.tscn")
var MenuScreen


# Called when the node enters the scene tree for the first time.
func _ready():
	var max_score = SettingsManager._settings["game_data"]["max_score"]
	MenuScreen = MenuScreenScene.instance()
	MenuScreen.high_score = max_score
	add_child(MenuScreen)
	MenuScreen.connect("btn_pressed", self, "_on_btn_pressed")
	get_tree().paused = true

func _on_btn_pressed():
	get_tree().paused = false
	if MenuScreen != null:
		MenuScreen.screen_out()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
