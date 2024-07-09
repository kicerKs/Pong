extends Node

var p1_score = 0
var p2_score = 0

var p1_pos = Vector2i(630, 150)
var p2_pos = Vector2i(4, 150)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("pause")):
		get_tree().paused = true
		$Menu.show()

func new_game():
	reset_players()
	$Ball.restart()
	$Ball.get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	$Ball.get_tree().paused = false

func reset_players():
	$Player1.position = p1_pos
	$Player2.position = p2_pos

func _on_ball_p_1_scored():
	p1_score += 1
	$HUD.update_p1_score(p1_score)
	new_game()

func _on_ball_p_2_scored():
	p2_score += 1
	$HUD.update_p2_score(p2_score)
	new_game()

func _on_menu_resume_pressed():
	get_tree().paused = false
	$Menu.hide()

func _on_menu_reset_pressed():
	$Ball.restart()
	reset_players()
	p1_score = 0
	$HUD.update_p1_score(p1_score)
	p2_score = 0
	$HUD.update_p2_score(p2_score)
	$Menu.change_game_status()

func _on_menu_start_one_player_pressed():
	$Player2.ai_controlled = true
	$Menu.change_game_status()
	$Menu.hide()
	new_game()

func _on_menu_start_two_players_pressed():
	$Player2.ai_controlled = false
	$Menu.change_game_status()
	$Menu.hide()
	new_game()
