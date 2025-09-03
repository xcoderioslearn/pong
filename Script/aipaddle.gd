extends CharacterBody2D

@export var speed: float = 850  
@export var ball_path: NodePath
@export var deadzone: float = 10.0 
@export var react_skip_chance: float = 0.0 
 

var original_color: Color
var sprite = Sprite2D

func _ready() -> void:
	sprite = $Paddle
	original_color = sprite.modulate  

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
	
func flash() -> void:
	sprite.modulate = Color.BLACK
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color(1,1,1, 0.5)  # grey
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = original_color
	
