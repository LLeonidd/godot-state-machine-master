extends KinematicBody2D

const SPEED = 150#180
const GRAVITY = 25
const JUMPFORCE = -500
const SPEED_SLIDE = 70

var velocity = Vector2(0,0) # Скорость игрока по координатам x, y
var double_jump 

var ui_left = 'ui_left'
var ui_right = 'ui_right'
var ui_up = 'ui_up'
var ui_close_attack = 'ui_close_attack'
var ui_ranged_attack = 'ui_ranged_attack'

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
