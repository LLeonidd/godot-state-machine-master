extends Node

var fsm: StateMachine

func enter():
	var direction = !fsm.player.flip_h
	fsm.player.play('ranged_attack')
	yield(get_tree().create_timer(0.3), "timeout")

	# Moving the sight 
	fsm.player.get_node('Gun').set_position(
		Vector2(
			fsm.get_direction(direction)*abs(fsm.player.get_node('Gun').get_position()[0]),
			fsm.player.get_node('Gun').get_position()[1]
		)
	)
	# Play bullet
	fsm.player.get_node('Gun').shoot(fsm.get_direction(direction))
	yield(get_tree().create_timer(0.1), "timeout")
	fsm.back()


func exit(next_state):
	fsm.change_to(next_state)


func process(_delta):
	pass
	#if not Input.is_action_pressed(fsm.player_root.ui_ranged_attack):
	#	fsm.back()

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
