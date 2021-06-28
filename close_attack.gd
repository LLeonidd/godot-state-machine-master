extends Node

var fsm: StateMachine

func enter():
	#yield(get_tree().create_timer(2.0), "timeout")
	fsm.player.play('close_attack')


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
	if not Input.is_action_pressed(fsm.player_root.ui_close_attack):
		fsm.back()

func input(_event):
	## attacks listener#####
	if _event.is_action_pressed(fsm.player_root.ui_close_attack):
		exit('close_attack')
	if _event.is_action_pressed(fsm.player_root.ui_ranged_attack):
		exit('ranged_attack')
	########################
	
func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
