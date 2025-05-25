extends Node
class_name System


var group:
	get:
		return get_group()


@export var is_active: bool:
	set(value):
		is_active = value
		#set_process(value)
		
func _init() -> void:
	pass
	#set_process(is_active)

		
func _ready() -> void:
	print("run: " + get_group()+" | "+str(is_active) )
	set_process(is_active)
	

func get_group():
	return "System"
