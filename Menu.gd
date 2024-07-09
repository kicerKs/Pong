extends CanvasLayer

signal resume_pressed
signal start_one_player_pressed
signal start_two_players_pressed
signal reset_pressed

var game_in_progress = true

# Called when the node enters the scene tree for the first time.
func _ready():
	change_game_status()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_game_status():
	game_in_progress = not game_in_progress
	if(game_in_progress):
		$ResumeButton.show()
		$ResetButton.show()
		$StartOnePlayerButton.hide()
		$StartTwoPlayersButton.hide()
	else:
		$ResumeButton.hide()
		$ResetButton.hide()
		$StartOnePlayerButton.show()
		$StartTwoPlayersButton.show()

func _on_resume_button_pressed():
	resume_pressed.emit()


func _on_start_one_player_button_pressed():
	start_one_player_pressed.emit()


func _on_start_two_players_button_pressed():
	start_two_players_pressed.emit()


func _on_reset_button_pressed():
	reset_pressed.emit()
