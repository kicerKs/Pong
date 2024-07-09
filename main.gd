extends Node

var p1_score = 0
var p2_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	$Ball.restart()
	$Ball.get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	$Ball.get_tree().paused = false

func _on_ball_p_1_scored():
	p1_score += 1
	$HUD.update_p1_score(p1_score)
	new_game()


func _on_ball_p_2_scored():
	p2_score += 1
	$HUD.update_p2_score(p2_score)
	new_game()
