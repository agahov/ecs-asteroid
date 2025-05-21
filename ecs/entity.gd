extends Node
class_name Entity


var components = {}


func _ready():
	for child in get_children():
		if child is Component:
			_reg_comp(child)
	_update_groups()


func add_component(comp):
	if get_node_or_null(NodePath(comp.name)) != null:
		print("Component already exists as a child.")
	else:
		add_child(comp)
	_reg_comp(comp)
	_update_groups()


func remove_component(comp):
	if get_node_or_null(NodePath(comp.name)) != null:
		remove_child(comp)
		components.erase(comp.get_comp_name())
		_update_groups()


func remove_component_by_name(comp_name):
	var comp = components[comp_name]
	remove_component(comp)



func _reg_comp(comp):
	if components.has(comp.get_comp_name()):
		Loggie.msg("_comp exist").domain("CORE_ERROR").warn()
		return
	else:
		components[comp.get_comp_name()] = comp


func _update_groups():
	# Check each group's requirements
	for group in Ecs.group_components:
		var required_components = Ecs.group_components[group]
		var has_all_components = true
		
		for comp_name in required_components:
			if not components.has(comp_name):
				has_all_components = false
				break
		
		# Update group membership
		var group_name = group
		if has_all_components:
			if not is_in_group(group_name):
				add_to_group(group_name)
		else:
			if is_in_group(group_name):
				remove_from_group(group_name)


func get_comp(property: StringName) -> Variant:
	if components.has(property):
		return components[property]
	return null
