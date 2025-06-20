extends Node
#class_name EcsHelpers

# Helper functions for group management
func update_entity_groups(entity: Entity) -> void:
	# Check each group's requirements
	for group in Ecs.group_components:
		var required_components = Ecs.group_components[group]
		var has_all_components = true
		
		for comp_name in required_components:
			if not entity.components.has(comp_name):
				has_all_components = false
				break
		
		# Update group membership
		var group_name = group
		if has_all_components:
			if not entity.is_in_group(group_name):
				entity.add_to_group(group_name)
		else:
			if entity.is_in_group(group_name):
				entity.remove_from_group(group_name)

func register_component(entity: Entity, comp: Component) -> void:
	if entity.components.has(comp.get_comp_name()):
		Loggie.msg("_comp exist").domain("CORE_ERROR").warn()
		return
	else:
		entity.components[comp.get_comp_name()] = comp

func add_component_to_entity(entity: Entity, comp: Component) -> void:
	if entity.get_node_or_null(NodePath(comp.name)) != null:
		print("Component already exists as a child.")
	else:
		entity.add_child(comp)
		register_component(entity, comp)
		update_entity_groups(entity)

func remove_component_from_entity(entity: Entity, comp: Component) -> void:
	if entity.get_node_or_null(NodePath(comp.name)) != null:
		entity.remove_child(comp)
		entity.components.erase(comp.get_comp_name())
		update_entity_groups(entity)

func remove_component_by_name_from_entity(entity: Entity, comp_name: String) -> void:
	var comp = entity.components[comp_name]
	if comp:
		remove_component_from_entity(entity, comp)

func get_component_from_entity(entity: Entity, property: StringName) -> Variant:
	if entity.components.has(property):
		return entity.components[property]
	return null
