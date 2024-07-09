extends Area2D

@export var speed = 150
@export var player = "p1"
@export var ball_pos = Vector2i(0, 0)
var screen_height
@export var ai_controlled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_height = get_viewport_rect().size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!ai_controlled):
		if(Input.is_action_pressed(player+"_move_up")):
			if(position.y - (speed * delta) - 10 > 0):
				position.y -= speed * delta
		if(Input.is_action_pressed(player+"_move_down")):
			if(position.y + (speed * delta) + 40 < screen_height):
				position.y += speed * delta
	else:
		if(position.y < ball_pos.y && position.y + (speed * delta) + 40 < screen_height): # piłka jest poniżej
			position.y += speed * delta
		if(position.y > ball_pos.y && position.y - (speed * delta) - 10 > 0):
			position.y -= speed * delta
