extends StaticBody2D

@export var flash_color: Color = Color(0.18, 0.36, 0.78) 
@export var flash_time: float = 0.15           

@onready var rect: ColorRect = $ColorRect
var base_color: Color

func _ready() -> void:
	base_color = rect.color

func flash() -> void:
	rect.color = flash_color
	await get_tree().create_timer(flash_time).timeout
	rect.color = base_color
