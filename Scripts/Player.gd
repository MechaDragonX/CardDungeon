extends CharacterBody2D

@export var speed: int = 50

var input_direction: get = _get_input_direction
var sprite_direction

@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta: float):
#	velocity = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down') * speed
#	move_and_slide()
	velocity = input_direction * speed
	move_and_slide()

func _get_input_direction():
	var x = -int(Input.is_action_pressed('ui_left')) + int(Input.is_action_pressed('ui_right'))
	var y = -int(Input.is_action_pressed('ui_up')) + int(Input.is_action_pressed('ui_down'))
	input_direction = Vector2(x, y).normalized()
	return input_direction
