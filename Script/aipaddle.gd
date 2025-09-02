extends CharacterBody2D
@export var speed: float = 850  
@export var ball_path: NodePath
@export var deadzone: float = 10.0 
@export var react_skip_chance: float = 0.0  

func _physics_process(_delta: float) -> void:
	var ball := get_node_or_null(ball_path)
	if ball == null: return
	if randf() < react_skip_chance: return

	if ball.velocity.x < 0: 
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var dy := 0.0
	if ball.global_position.y > global_position.y + deadzone:
		dy = 1.0
	elif ball.global_position.y < global_position.y - deadzone:
		dy = -1.0
	velocity = Vector2(0, dy * speed)
	move_and_slide()
