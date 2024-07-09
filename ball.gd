extends Area2D

signal p1_scored
signal p2_scored

var v_speed
var h_speed
var up_down_direction = -1
var left_right_direction = 1
var screen_size
var speed_multiplier = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	rand_h_speed()
	rand_v_speed()

func restart():
	position = screen_size / 2
	rand_h_speed()
	rand_v_speed()
	speed_multiplier = 1.0

func rand_h_speed():
	h_speed = randi_range(50, 150)

func rand_v_speed():
	v_speed = randi_range(75, 175)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += up_down_direction * v_speed * delta * speed_multiplier
	position.x += left_right_direction * h_speed * delta * speed_multiplier

func _on_area_entered(area):
	if(area.name == "Boundaries"):
		up_down_direction = up_down_direction * -1
	if(area.name == "Player1" or area.name == "Player2"):
		left_right_direction = left_right_direction * -1
		speed_multiplier += 0.05
		rand_h_speed()

func _on_visible_on_screen_notifier_2d_screen_exited():
	if(position.x < 0):
		p1_scored.emit()
	else:
		p2_scored.emit()
