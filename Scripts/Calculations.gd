extends Node2D

signal wrong_answer
signal correct_answer

var HeartScene = preload("res://Scenes/heart.tscn")
var ScoreGainEffectScene = preload("res://Scenes/ScoreGainTextEffect.tscn")
var hearts_list = []

onready var PlayServices = get_node("/root/GPlay")
onready var LineEditNode = get_node("../LineEdit")
onready var NumberGeneratorNode = get_node("../NumberGenerator")
onready var ScoreNode = get_node("../VBoxContainer2/HBoxContainer2/Skor")
onready var MaxScoreNode = get_node("../VBoxContainer2/HBoxContainer2/IyiSkor")
onready var ProgressBarNode = get_node("../ProgressBar")
onready var HeartsContainerNode = get_node("../VBoxContainer2/HBoxContainer")

var score
var max_score = 0
var initial_hearts = 3
var hearts = 0 setget hearts_set, hearts_get

var answer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if not SettingsManager.is_connected("max_score_retrieved", self, "_on_max_score_retrieved"):
		SettingsManager.connect("max_score_retrieved", self, "_on_max_score_retrieved")
	#hearts = SettingsManager._settings["game_data"]["hearts"]
	for heart in HeartsContainerNode.get_children():
		heart.queue_free()
	hearts_list.clear()
# warning-ignore:unused_variable
	for i in range(initial_hearts):
		self.hearts += 1
#		var heart = HeartScene.instance()
#		HeartsContainerNode.add_child(heart)
#		hearts_list.append(heart)
	score = 0
	max_score = SettingsManager._settings["game_data"]["max_score"]
	ScoreNode.text = "Score : " + str(score)
	MaxScoreNode.text = "Best Score : " + str(max_score)
	LineEditNode.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func hearts_set(value):
	if value < hearts:
		if (hearts-value) == 1 and value >= 0:
			hearts = value
			hearts_list[-1].explode()
			hearts_list.remove(hearts_list.size()-1)
	elif value > hearts:
		if (value - hearts) == 1:
			hearts = value
			var heart = HeartScene.instance()
			HeartsContainerNode.add_child(heart)
			hearts_list.append(heart)

func showScoreGainAnimation(type : String):
	var node = ScoreGainEffectScene.instance()
	if type == "Gain":
		node.position = get_node("../LineEdit").rect_position + Vector2(get_node("../LineEdit").rect_size.x, 0)
		get_parent().add_child(node)
		node.PlayScoreGainAnimation()
	elif type == "Lose":
		node.position = get_node("../LineEdit").rect_position
		get_parent().add_child(node)
		node.PlayScoreLoseAnimation()
		
	
func hearts_get():
	return hearts

func _on_max_score_retrieved(new_max_score : int):
	print("max score change")
	max_score = new_max_score
	MaxScoreNode.text = "Best Score : " + str(max_score)

func _on_CheckButton_pressed():
	if LineEditNode.text != "":
		var number = int(LineEditNode.text)
		if number == answer:
			emit_signal("correct_answer")
			#ProgressBarNode.value = 100
			ProgressBarNode.time -= 1
			ProgressBarNode.start_progress()
			score += 1
			ScoreNode.text = "Score : " + str(score)
			SettingsManager._settings["game_data"]["score"] = score
			showScoreGainAnimation("Gain")
			NumberGeneratorNode.print_to_screen()
			LineEditNode.get_node("AnimationPlayer").play("right_answer")
			LineEditNode.text = ""
		else:
			emit_signal("wrong_answer")
			score -= 1
			ScoreNode.text = "Score : " + str(score)
			SettingsManager._settings["game_data"]["score"] = score
			showScoreGainAnimation("Lose")
			LineEditNode.get_node("AnimationPlayer").play("wrong_answer")
			LineEditNode.text = ""
		SettingsManager.save_settings()


func _on_ProgressBar_game_over():
	#max_score = SettingsManager._settings["game_data"]["max_score"]
	self.hearts -= 1
	if score > max_score :
		max_score = score
		SettingsManager._settings["game_data"]["max_score"] = max_score
		SettingsManager.save_settings()
		PlayServices.submit_score(max_score)


func _on_ProgressBar_heart_lose():
	self.hearts -= 1
	
	
