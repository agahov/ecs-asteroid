extends System


func get_group():
	return QueryGroup.IMPULSEABLE


#func _activate() -> void:
	#
	#var entities = get_tree().get_nodes_in_group(group)
	#
	## Process each entity
	#for entity in entities:
		#canvas.add_child(entity.c_polygon)
		
		
func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	for entity in entities:
		update(entity, _delta)


#render data point
func update(entity, _delta):
	#??? position 
	#var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)
	var movement_comp = entity.get_comp(Components.MOVEMENT)
	var impulse_comp = entity.get_comp(Components.IMPULSE)
	
	var v:Vector2
	movement_comp.direction += impulse_comp.direction
	movement_comp.direction = movement_comp.direction.normalized()
	movement_comp.speed += impulse_comp.speed
	entity.remove_component(impulse_comp)
