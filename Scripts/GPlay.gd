extends Node

signal score_retrieved(score_dictionary)

var _play_services = null
const leaderboard_id = "CgkI1f_NjZQDEAIQAg"
const client_id = "108476465109-5rimemuoopfbt6vpngo0iljaennrafnc.apps.googleusercontent.com"


# Called when the node enters the scene tree for the first time.
func _ready():
	_init()
	_connect_signals()
	sign_in()

func retreive_score():
	_play_services.retrieveLeaderboardScore(leaderboard_id, "ALL_TIME", "ALL")

func show_leaderboard():
	if not _play_services.isSignedIn():
		sign_in()
	else:
		_play_services.showLeaderBoard(leaderboard_id)

func submit_score(max_score : int):
	if _play_services:
		_play_services.submitLeaderBoardScore(leaderboard_id, max_score)

func sign_in():
	if _play_services:
		_play_services.signIn()

func _init():
	if Engine.has_singleton("GodotPlayGamesServices"):
		_play_services = Engine.get_singleton("GodotPlayGamesServices")
		_play_services.init(true, true, true, "")

func _connect_signals():
	if _play_services:
		_play_services.connect("_on_sign_in_success", self, "_on_sign_in_success")
		_play_services.connect("_on_sign_in_failed", self, "_on_sign_in_failed")
		_play_services.connect("_on_leaderboard_score_retrieved", self, "_on_leaderboard_score_retrieved")
		_play_services.connect("_on_leaderboard_score_retrieve_failed", self, "_on_leaderboard_score_retrieve_failed")
		_play_services.connect("_on_leaderboard_score_submitting_failed", self, "_on_leaderboard_score_submitting_failed")

func _on_sign_in_success(account_id : String):
	retreive_score()
	print("Successful sign in")

func _on_leaderboard_score_retrieved(playScore : String):
	var score_dict : Dictionary = parse_json(playScore)
	emit_signal("score_retrieved", score_dict)

func _on_leaderboard_score_retrieve_failed():
	if _play_services.isSignedIn():
		retreive_score()

func _on_sign_in_failed(error_code : int):
	print("Failed to sign in with error code %s" % error_code)

func _on_leaderboard_score_submitting_failed():
	# failed oldugunda atanamayan degeri geri gonderiyor mu?
	# gonderiyorsa ayni degeri tekrar submit etmeyi dene.
	if _play_services.isSignedIn():
		pass
