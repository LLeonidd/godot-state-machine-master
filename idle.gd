extends Node

var fsm: StateMachine


func enter():
	fsm.player.play('idle')


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
	if _event.is_action_pressed(fsm.ui_left) or _event.is_action_pressed(fsm.ui_right):
		exit('run')
	elif _event.is_action_pressed(fsm.ui_up) :
		print("event precced up")
		exit('jump')

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
