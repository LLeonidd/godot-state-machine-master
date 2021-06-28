extends Node

var fsm: StateMachine

func enter():
	fsm.player.play('jump')


func exit(next_state):
	fsm.change_to(next_state)


func process(_delta):
	# Replace pass with your handler code
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
