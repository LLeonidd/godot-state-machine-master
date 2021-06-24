extends Node

var fsm: StateMachine

var double_jump

func enter():
	print("Jump")
	#yield(get_tree().create_timer(2.0), "timeout")
	fsm.player.play('jump')
	fsm.player_root.velocity.y = fsm.player_root.JUMPFORCE
	double_jump = true


func exit(next_state):
	fsm.change_to(next_state)

####################################################
### Optional handler functions for game loop events.
### Delete the ones that you don't need.
####################################################
func process(_delta):
	# Replace pass with your handler code
	pass

func physics_process(_delta):
	if Input.is_action_just_pressed(fsm.ui_up) and fsm.player_root.is_on_floor():
		fsm.player_root.velocity.y = fsm.player_root.JUMPFORCE
	if Input.is_action_pressed(fsm.ui_right):
		fsm.player_root.velocity.x = fsm.get_direction(true)*fsm.player_root.SPEED
		fsm.set_direction(fsm.player, true)
	if Input.is_action_pressed(fsm.ui_left):
		fsm.player_root.velocity.x = fsm.get_direction(false)*fsm.player_root.SPEED
		fsm.set_direction(fsm.player, false)

	# Return to next station
	if not Input.is_action_pressed(fsm.ui_up) and fsm.player_root.is_on_floor():
		exit('idle')
	if (Input.is_action_pressed(fsm.ui_left) or Input.is_action_pressed(fsm.ui_right)) and  fsm.player_root.is_on_floor():
		exit('run')
	elif fsm.player_root.is_on_floor():
		exit('idle')
	

	
	

func input(_event):
	pass
	if Input.is_action_just_pressed(fsm.ui_up) and double_jump:
		fsm.player_root.velocity.y = fsm.player_root.JUMPFORCE
		double_jump = false
	#	print('press right in jump handler')
	#	fsm.player_root.velocity.x = fsm.get_direction(Input.is_action_pressed(fsm.ui_right))*fsm.player_root.SPEED
	

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
