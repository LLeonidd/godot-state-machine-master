extends Node

var fsm: StateMachine
var direction

func enter():
	fsm.player.play('slide')
	direction = fsm.get_direction(Input.is_action_pressed(fsm.player_root.ui_right))
	


func exit(next_state):
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
