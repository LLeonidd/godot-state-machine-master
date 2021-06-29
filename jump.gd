extends Node

var fsm: StateMachine


func enter():
	print("Jump")
	#yield(get_tree().create_timer(2.0), "timeout")
	fsm.player.play('jump')
	fsm.player_root.velocity.y = fsm.player_root.JUMPFORCE
	fsm.player_root.double_jump = true


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
	if Input.is_action_just_pressed(fsm.player_root.ui_up) and fsm.player_root.is_on_floor():
		fsm.player_root.velocity.y = fsm.player_root.JUMPFORCE
	if Input.is_action_pressed(fsm.player_root.ui_right):
		fsm.player_root.velocity.x = fsm.get_direction(true)*fsm.player_root.SPEED
		fsm.set_direction(fsm.player, true)
	if Input.is_action_pressed(fsm.player_root.ui_left):
		fsm.player_root.velocity.x = fsm.get_direction(false)*fsm.player_root.SPEED
		fsm.set_direction(fsm.player, false)

	# Return to next station
	if not Input.is_action_pressed(fsm.player_root.ui_up) and fsm.player_root.is_on_floor():
		exit('idle')
	if (Input.is_action_pressed(fsm.player_root.ui_left) or Input.is_action_pressed(fsm.player_root.ui_right)) and  fsm.player_root.is_on_floor():
		exit('run')
	if fsm.player_root.is_on_floor():
		exit('idle')
	if fsm.player_root.is_on_wall() and (Input.is_action_pressed(fsm.player_root.ui_left) or Input.is_action_pressed(fsm.player_root.ui_right)):
		exit('slide')
	if fsm.player_root.velocity.y>0:
		exit('falling')
	


func input(_event):
	if Input.is_action_just_pressed(fsm.player_root.ui_up) and fsm.player_root.double_jump:
		fsm.player_root.velocity.y = fsm.player_root.JUMPFORCE
		fsm.player_root.double_jump = false
	if Input.is_action_just_pressed(fsm.player_root.ui_close_attack):
		exit('air_attack')
	#	print('press right in jump handler')
	#	fsm.player_root.velocity.x = fsm.get_direction(Input.is_action_pressed(fsm.ui_right))*fsm.player_root.SPEED
	

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
