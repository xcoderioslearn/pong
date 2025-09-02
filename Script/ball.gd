extends CharacterBody2D

@export var start_speed: float = 580.0
@export var max_speed: float = 2000
@export var speed_growth: float = 1.10  

var direction: Vector2 = Vector2.ZERO
var speed: float = 0.0

func _ready() -> void:
	reset_ball()

func reset_ball() -> void:
	global_position = get_viewport_rect().size / 2
	speed = start_speed

	var x := 0.0
	while abs(x) < 0.5:
		x = randf_range(-1.0, 1.0)
	var y = randf_range(-0.6, 0.6)
	direction = Vector2(x, y).normalized()

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)

	if collision:
		var collider = collision.get_collider()
		direction = direction.bounce(collision.get_normal()).normalized()

		
		if collider.is_in_group("paddle"):
			speed = min(speed * speed_growth, max_speed)


		elif collider.has_method("flash"):
			collider.flash()
