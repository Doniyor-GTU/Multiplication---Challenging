extends Node

signal max_score_retrieved(new_max_score)

onready var PlayServices = get_node("/root/GPlay")

const SAVE_PATH = "user://config.cfg"

var _config_file = ConfigFile.new()
var _settings = {
	"game_data": {
		"max_score" : 0
	},
	"audio": {
		"sounds_on" : true
	}
}

func _ready():
	load_settings()
	PlayServices.connect("score_retrieved", self, "_on_score_retrieved")
	#TranslationServer.set_locale(_settings["other"]["language"])
	
func save_settings():
	#TranslationServer.set_locale(_settings["other"]["language"])
	for section in _settings.keys():
		for key in _settings[section].keys():
			_config_file.set_value(section, key, _settings[section][key])
	var error = _config_file.save(SAVE_PATH)
	if error != OK:
		print("Settings file not saved. Error code %s" % error)
		return null
	
func load_settings():
	var error = _config_file.load(SAVE_PATH)
	if error != OK:
		if error == 7:
			save_settings()
		else:
			print("Failed loading settings file. Error code %s" % error)
			return null
	for section in _settings.keys():
		for key in _settings[section].keys():
			var val = _settings[section][key]
			_settings[section][key] = _config_file.get_value(section, key, val)
			

func _on_score_retrieved(score_dictionary : Dictionary):
	print("retrieved")
	var retrieved_score = int(score_dictionary["score"])
	var max_score = _settings["game_data"]["max_score"]
	if max_score < retrieved_score:
		_settings["game_data"]["max_score"] = retrieved_score
		print("new score ", retrieved_score, " saved")
		save_settings()
		emit_signal("max_score_retrieved", retrieved_score)
	elif max_score > retrieved_score:
		PlayServices.submit_score(max_score)
		
