extends Node

var fsm: StateMachine

func enter():
	fsm.player.play('air_attack_close')
	yield(get_tree().create_timer(0.2), "timeout")
	exit('falling')


func exit(next_state):
	fsm.change_to(next_state)


func process(_delta):
	if Input.is_action_pressed(fsm.player_root.ui_right):
		fsm.player_root.velocity.x = fsm.get_direction(true)*fsm.player_root.SPEED
		fsm.set_direction(fsm.player, true)
	if Input.is_action_pressed(fsm.player_root.ui_left):
		fsm.player_root.velocity.x = fsm.get_direction(false)*fsm.player_root.SPEED
		fsm.set_direction(fsm.player, false)

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
