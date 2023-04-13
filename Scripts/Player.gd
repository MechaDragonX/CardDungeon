extends CharacterBody2D

@export var speed: int = 50
@onready var sprite = $AnimatedSprite2D
var input_direction: get = _get_input_direction
var sprite_direction = 'Down': get = _get_sprite_direction


func _physics_process(_delta: float):
	velocity = input_direction * speed
	move_and_slide()
	
	sprite.play('Walk' + sprite_direction)
	if velocity == Vector2.ZERO:
		sprite.play('Stop' + sprite_direction)


func _get_input_direction():
	var x = -int(Input.is_action_pressed('ui_left')) + int(Input.is_action_pressed('ui_right'))
	var y = -int(Input.is_action_pressed('ui_up')) + int(Input.is_action_pressed('ui_down'))
	input_direction = Vector2(x, y).normalized()
	return input_direction


func _get_sprite_direction():
	match input_direction:
		Vector2.UP:
			sprite_direction = 'Up'
		Vector2.DOWN:
			sprite_direction = 'Down'
		Vector2.LEFT:
			sprite_direction = 'Left'
		Vector2.RIGHT:
			sprite_direction = 'Right'
	return sprite_direction
