extends KinematicBody2D

var motion = Vector2()
const GRAVITY = 20
var UP = Vector2(0,-1)

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	else:
		motion.x = 0
	move_and_slide(motion,UP)
	pass

