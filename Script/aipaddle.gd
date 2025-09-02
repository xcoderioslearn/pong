extends CharacterBody2D

@export var speed: float = 300.0
@export var ball: NodePath   

func _physics_process(delta: float) -> void:
	var ball_node = get_node_or_null(ball)
	if ball_node == null:
		return

	
	if ball_node.global_position.y > global_position.y + 10:
		velocity = Vector2(0, speed)
	elif ball_node.global_position.y < global_position.y - 10:
		velocity = Vector2(0, -speed)
	else:
		velocity = Vector2.ZERO

	move_and_slide()
