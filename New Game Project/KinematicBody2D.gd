extends KinematicBody2D

const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 50
const JUMP_HEIGHT = -550
const UP = Vector2(0,-1)
var motion = Vector2()  #This is a kind of data that can hold X and Y data, so our x and y movement for character

func _physics_process(delta):
	motion.y += GRAVITY   #This adds gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"): #method to detect a button press, right arrow key
		#motion.x += ACCELERATION   #Sets our positive X movement,statement below replaces this    
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)  #sets motion.x to the smaller of the two so we don't go super fast
		get_node("Sprite").flip_h = false   #get_node("Sprite") is the same as saying $Sprite
		$Sprite.play("Run")                 #Also note that it has to be the Name of the node not the type
	elif Input.is_action_pressed("ui_left"):  #method to detecta button press, left arrow key
		#motion.x -= ACCELERATION                      #elif = else if
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true    #Flips Sprite Direction 
		$Sprite.play("Run")  
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		friction = true
		$Sprite.play("Idle")
		  
	
	if is_on_floor():
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
	
	motion = move_and_slide(motion, UP)  #method that takes in Vector2 values to allow us to move the node
	pass

