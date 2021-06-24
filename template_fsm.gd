extends Node

var fsm: StateMachine

func enter():
	print("Jump")
	#yield(get_tree().create_timer(2.0), "timeout")
	fsm.player.play('jump')


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
	pass

func input(_event):
	if not _event.is_action_pressed('ui_up'):
		exit('idle')

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
