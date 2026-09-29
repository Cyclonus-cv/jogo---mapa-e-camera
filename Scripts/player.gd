extends CharacterBody2D

const SPEED = 80.0
func _physics_process(_delta: float) -> void:
	velocity =  Vector2.ZERO

	if Input.is_action_pressed('ui_left'):
		velocity.x = -1 * SPEED
	if Input.is_action_pressed('ui_right'):
		velocity.x = 1 * SPEED
	if Input.is_action_pressed('ui_up'):
		velocity.y = -1 * SPEED
	if Input.is_action_pressed('ui_down'):
		velocity.y = 1 * SPEED
	move_and_slide()

	if get_slide_collision_count() > 0:
		get_tree().reload_current_scene()
		
	if velocity == Vector2.ZERO: $"Animacao".play("idle")
	else: $"Animacao".play("walk")
		
	if velocity.x < 0.0: $"Animacao".flip_h = true
	else: $"Animacao".flip_h = false


func _on_alvo_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
