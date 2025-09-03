extends CharacterBody2D

@export var speed: float = 1000.0
var original_color: Color
var sprite: Sprite2D

func _ready() -> void:
	sprite = $Paddle
	original_color = sprite.modulate  

func _physics_process(_delta: float) -> void:
	var dy := int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	velocity = Vector2(0, dy * speed)
	move_and_slide()

func flash() -> void:
	sprite.modulate = Color.BLACK
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color(1,1,1, 0.5)  # grey
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = original_color
	
