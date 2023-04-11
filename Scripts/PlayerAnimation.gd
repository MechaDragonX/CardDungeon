extends Sprite2D

const SPRITES_DICT := {
	Vector2.UP: preload("Assets/player_up"),
	Vector2.DOWN: preload("Assets/player_down"),
	Vector2.LEFT: preload("Assets/player_left"),
	Vector2.RIGHT: preload("Assets/player_right"),
	Vector2(1.0, 1.0): preload("Assets/player_down_right"),
	Vector2(-1.0, 1.0): preload("Assets/player_up_right"),
	Vector2(1.0, -1.0): preload("Assets/player_up_right"),
	Vector2(-1.0, -1.0): preload("Assets/player_down_right"),
}

var look_direction := Vector2.RIGHT

Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_vector := Vector2(
		float(Input.get_action_strength('ui_right')) - float(Input.get_action_strength('ui_left')),
		float(Input.get_action_strength('ui_down')) - float(Input.get_action_strength('ui_up'))
	)
	if input_vector.length() > 0.0 and input_vector != look_direction:
		texture = Sprites_MAP[input_vector]
		look_direction = input_vector
		flip_h = sign(look_direction.x) == -1.0
