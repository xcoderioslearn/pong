extends Node2D

var left_score := 0
var right_score := 0

@onready var ball = $Ball
@onready var left_label = $LeftScore
@onready var right_label = $RightScore

func _process(_delta):
	var screen_size = get_viewport_rect().size
	if ball.global_position.x < 0:
		right_score += 1
		update_score()
	elif ball.global_position.x > screen_size.x:
		left_score += 1
		update_score()

func update_score():
	left_label.text = str(left_score)
	right_label.text = str(right_score)
	ball.reset_ball()
