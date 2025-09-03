extends Node2D

@onready var ball = $Ball
@onready var left_score_label = $LeftScore
@onready var right_score_label = $RightScore

var left_score := 0
var right_score := 0

func _process(_delta):
	var screen_width = get_viewport_rect().size.x

	if ball.global_position.x < 0:
		right_score += 1
		update_score()
		ball.reset_ball()
		var score_sfx = get_tree().get_first_node_in_group("sfx_score")
		if score_sfx:
			score_sfx.play()

	elif ball.global_position.x > screen_width:
		left_score += 1
		update_score()
		ball.reset_ball()
		var score_sfx = get_tree().get_first_node_in_group("sfx_score")
		if score_sfx:
			score_sfx.play()

func update_score():
	left_score_label.text = str(left_score)
	right_score_label.text = str(right_score)
