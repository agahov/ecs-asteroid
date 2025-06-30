extends Node
class_name Entity

var components = {}

@export var comp_type: String = "entity"

func _ready():
	for child in get_children():
		if child is Component:
			EcsHelpers.register_component(self, child)
	EcsHelpers.update_entity_groups(self)
	
	
	
func get_comp_name() -> String:
	return comp_type
	

func add_component(comp):
	EcsHelpers.add_component_to_entity(self, comp)

func remove_component(comp):
	EcsHelpers.remove_component_from_entity(self, comp)

func remove_component_by_name(comp_name):
	EcsHelpers.remove_component_by_name_from_entity(self, comp_name)

func get_comp(property: StringName) -> Variant:
	return EcsHelpers.get_component_from_entity(self, property)

func has_component_by_name(comp_name: StringName) -> bool:
	return components.has(comp_name)

# Override to ensure only direct children are considered for groups
func _update_groups():
	EcsHelpers.update_entity_groups(self)
