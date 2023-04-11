extends CharacterBody2D

const SPEED = 500

func _physics_process(delta: float) -> void:
	var input_vector := Vector2(
		Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left'),
		Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	)
	var move_direction := input_vector.normalized()
	move_and_slide(SPEED * move_direction)
