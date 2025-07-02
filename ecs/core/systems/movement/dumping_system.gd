extends System


func get_group():
	return QueryGroup.DAMPABLE


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
func update(entity, delta):
	#??? position 
	#var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)
	var movement_comp = entity.get_comp(Components.MOVEMENT)
	var damping_comp = entity.get_comp(Components.DAMPING)
	
	damping_comp.elapsed_time += delta

	var normalized_time = damping_comp.elapsed_time / damping_comp.total_time
	var damping = damping_comp.curve.sample(normalized_time)


	movement_comp.speed *= damping
	
	if movement_comp.speed < movement_comp.min_speed:
		movement_comp.speed = movement_comp.min_speed
	
	print("damping: " + str(damping))

	if normalized_time > 1:
		entity.remove_component(damping_comp)
