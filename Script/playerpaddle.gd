extends CharacterBody2D
@export var speed: float = 1000.0

func _physics_process(_delta: float) -> void:
	var dy := int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	velocity = Vector2(0, dy * speed)
	move_and_slide()
