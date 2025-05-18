extends Node
class_name System


@export var is_active:bool:
	set(value):
		is_active = value
		set_process(value)
		
