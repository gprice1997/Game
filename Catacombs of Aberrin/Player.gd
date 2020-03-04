extends KinematicBody2D

var motion = Vector2()
const MAX_SPEED = 200
const GRAVITY = 20
const MAX_GRAVITY = 40
const ACCELERATION = 50
const JUMP_HEIGHT = -350
var UP = Vector2(0,-1)
var lastmotion = 0

func _physics_process(delta):
	
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		get_node("Sprite").flip_h = true
		$Sprite.play("Running")
		lastmotion = 1
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		get_node("Sprite").flip_h = false
		$Sprite.play("Running")
		lastmotion = -1
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		friction = true
		if lastmotion > 0 :
			get_node("Sprite").flip_h = true
			$Sprite.play("Idle")
		else:
			get_node("Sprite").flip_h = false
			$Sprite.play("Idle")
			
	if is_on_floor():
		motion.y = min(motion.y + GRAVITY, MAX_GRAVITY)
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
				motion.x = lerp(motion.x,0,0.2)
	else:
			if motion.y < 0:
				$Sprite.play("Jump")
			else:
				$Sprite.play("Fall")
			if friction == true:
				motion.x = lerp(motion.x,0,0.05)
	move_and_slide(motion,UP)
	pass

