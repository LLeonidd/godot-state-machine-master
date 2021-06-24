extends Node

class_name StateMachine

const DEBUG = true
const PATH_TO_PARENT = '../'
const PLAYER_OBJECT = 'Sprite' 
const SATATE_LABEL = 'current_state' 

var state: Object
var history = []

var offset_list = [15,0] # values for offset left (0-index) or right (1-index), for correct direction

onready var player_root = get_node(PATH_TO_PARENT)
onready var player = player_root.find_node(PLAYER_OBJECT)
onready var state_label = player_root.find_node(SATATE_LABEL)
# user actions
onready var ui_left = 'ui_left'
onready var ui_right = 'ui_right'
onready var ui_up = 'ui_up'


#refs to functions
#onready var move_and_slide = funcref(player_root, "move_and_slide")


func _ready():
	# Set the initial state to the first child node
	state = get_child(0)
	# Allow for all nodes to be ready before calling _enter_state
	call_deferred("_enter_state")


func change_to(new_state):
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()


func back():
	if history.size() > 0:
		state = get_node(history.pop_back())
		_enter_state()


func _enter_state():
	if DEBUG:
		state_label.text = state.name
		print("Entering state: ", state.name)
	# Give the new state a reference to it's state machine i.e. this one
	state.fsm = self
	state.enter()


# Route Game Loop function calls to
# current state handler method if it exists
func _process(delta):
	if state.has_method("process"):
		state.process(delta)


func _physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)


func _input(event):
	if state.has_method("input"):
		state.input(event)

func _unhandled_input(event):
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)


func _unhandled_key_input(event):
	if state.has_method("unhandled_key_input"):
		state.unhandled_key_input(event)


func _notification(what):
	if state and state.has_method("notification"):
			state.notification(what)


# Aditional functions
func get_direction(direction_right):
	return 2*int(direction_right)-1
	
	
func get_offset_x(direction_right):
	return offset_list[int(direction_right)]
	

func set_direction(player, direction_right):
	player.scale = Vector2(get_direction(direction_right),1)
	player.offset = Vector2(get_offset_x(direction_right),0)
	


