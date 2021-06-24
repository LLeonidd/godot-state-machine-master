extends Node


var fsm: StateMachine

func enter():
	fsm.set_direction(fsm.player, Input.is_action_pressed(fsm.ui_right))
	fsm.player.play('run')


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
	if Input.is_action_pressed(fsm.ui_right) or Input.is_action_pressed(fsm.ui_left):
		fsm.player_root.velocity.x = fsm.get_direction(Input.is_action_pressed(fsm.ui_right))*fsm.player_root.SPEED
	
	if Input.is_action_just_pressed(fsm.ui_up):
		exit('jump')
	
	if not (Input.is_action_pressed(fsm.ui_left) or Input.is_action_pressed(fsm.ui_right)):
		print("up_button")
		exit('idle')

func input(_event):
	if Input.is_action_just_pressed(fsm.ui_left):
		fsm.set_direction(fsm.player, false)
		Input.action_release(fsm.ui_right)
	if Input.is_action_just_pressed(fsm.ui_right):
		fsm.set_direction(fsm.player, true)
		Input.action_release(fsm.ui_left)
	

		

	

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
