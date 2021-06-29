extends Node

var fsm: StateMachine
var direction
onready var slide_particles

func enter():
	fsm.player.play('slide')
	fsm.player_root.double_jump = true
	slide_particles=fsm.player.get_node('slide_particles')
	slide_particles.emitting = true
	slide_particles.visible = true
	slide_particles.scale = Vector2(fsm.get_direction(!fsm.player.flip_h),1)
	slide_particles.position.x = fsm.get_direction(!fsm.player.flip_h) * abs(slide_particles.position.x)
	direction = fsm.get_direction(Input.is_action_pressed(fsm.player_root.ui_right))
	


func exit(next_state):
	slide_particles.emitting = false
	slide_particles.visible = false
	fsm.change_to(next_state)


func process(_delta):
	# Replace pass with your handler code
	pass


func physics_process(_delta):
	fsm.player_root.velocity.y = fsm.player_root.SPEED_SLIDE
	if fsm.player_root.is_on_floor():
		exit('idle')

	

func input(_event):
	if _event.is_action_pressed(fsm.player_root.ui_left) or _event.is_action_pressed(fsm.player_root.ui_right):
		exit('falling')
	if _event.is_action_pressed(fsm.player_root.ui_up):
		Input.action_release(fsm.player_root.ui_left)
		Input.action_release(fsm.player_root.ui_right)
		exit('jump')

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
