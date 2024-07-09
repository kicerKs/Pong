extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_p1_score(score):
	$P1ScoreLabel.text = "P1 Score: " + str(score)

func update_p2_score(score):
	$P2ScoreLabel.text = "P2 Score: " + str(score)
