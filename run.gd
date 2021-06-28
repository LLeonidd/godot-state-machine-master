extends Node

var fsm: StateMachine


func enter():
	fsm.player.play('run')


func exit(next_state):
	fsm.change_to(next_state)


func process(_delta):
	# Replace pass with your handler code
	pass

func physics_process(_delta):
	if Input.is_action_pressed(fsm.player_root.ui_right) or Input.is_action_pressed(fsm.player_root.ui_left):
		fsm.set_direction(fsm.player, Input.is_action_pressed(fsm.player_root.ui_right))
		fsm.player_root.velocity.x = fsm.get_direction(Input.is_action_pressed(fsm.player_root.ui_right))*fsm.player_root.SPEED
	
	if Input.is_action_just_pressed(fsm.player_root.ui_up):
		exit('jump')
	if not (Input.is_action_pressed(fsm.player_root.ui_left) or Input.is_action_pressed(fsm.player_root.ui_right)):
		exit('idle')
	if not fsm.player_root.is_on_floor():
		exit('falling')


func input(_event):
	if _event.is_action_pressed(fsm.player_root.ui_left):
		fsm.set_direction(fsm.player, false)
		Input.action_release(fsm.player_root.ui_right)
	if _event.is_action_pressed(fsm.player_root.ui_right):
		fsm.set_direction(fsm.player, true)
		Input.action_release(fsm.player_root.ui_left)
	if _event.is_action_pressed(fsm.player_root.ui_close_attack):
		exit('close_attack')
	

		

	

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
