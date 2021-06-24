extends KinematicBody2D

const SPEED = 260#180
const GRAVITY = 35
const JUMPFORCE = -700

var velocity = Vector2(0,0) # Скорость игрока по координатам x, y

func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP) # Vector2.UP - направелние снизу вверх. Внизу пол.
	velocity.y +=  GRAVITY
	
	# Allows you to stop instead of sliding constantly
	# lerp interpolation
	# Interpolates the numbers x to 0, in 30% increments 
	velocity.x = lerp(velocity.x, 0, 0.3) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
