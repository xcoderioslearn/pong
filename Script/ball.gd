extends CharacterBody2D

@export var speed: float = 700

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	reset_ball()

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		direction = direction.bounce(collision.get_normal())

func reset_ball() -> void:
	global_position = get_viewport_rect().size / 2
	direction = Vector2(randf_range(-1, 1), randf_range(-0.5, 0.5)).normalized()
