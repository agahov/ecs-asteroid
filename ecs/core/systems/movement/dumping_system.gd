extends System


func get_group():
	return QueryGroup.DUMPABLE


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
	var dumping_comp = entity.get_comp(Components.DUMPING)
	
	# Check if required components exist

	
	movement_comp.speed = dumping_comp.factor * movement_comp.speed
	if movement_comp.speed < movement_comp.min_speed:
		movement_comp.speed = movement_comp.min_speed
		
