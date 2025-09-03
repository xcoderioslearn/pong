extends CharacterBody2D

@export var start_speed: float = 700.0
@export var max_speed: float = 2000.0
@export var speed_growth: float = 1.10

var direction: Vector2 = Vector2.ZERO
var speed: float = 0.0
var respawning: bool = false 

func _ready() -> void:
	reset_ball()

func reset_ball() -> void:
	respawning = true
	global_position = get_viewport_rect().size / 2
	speed = 0.0
	direction = Vector2.ZERO
	await get_tree().create_timer(1.5).timeout

	speed = start_speed
	var x := (-1.0 if randf() < 0.5 else 1.0) * randf_range(0.5, 1.0)
	var y := randf_range(-0.6, 0.6)
	direction = Vector2(x, y).normalized()
	respawning = false

func _physics_process(delta: float) -> void:
	if respawning:
		return  

	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)

	if collision:
		var collider = collision.get_collider()
		direction = direction.bounce(collision.get_normal()).normalized()

		if collider.is_in_group("paddle"):
			speed = min(speed * speed_growth, max_speed)

			if collider.has_method("flash"):
				collider.flash()

			var paddle_sfx = get_tree().get_first_node_in_group("sfx_paddle_hit")
			if paddle_sfx:
				paddle_sfx.play()

		elif collider.has_method("flash"):
			collider.flash()
			var wall_sfx = get_tree().get_first_node_in_group("sfx_wall_hit")
			if wall_sfx:
				wall_sfx.play()
