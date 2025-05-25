extends Node
class_name System




@export var is_active:bool:
	set(value):
		is_active = value
		set_process(value)
		
func _init() -> void:
	set_process(is_active)

		
func _ready() -> void:
	pass
	
