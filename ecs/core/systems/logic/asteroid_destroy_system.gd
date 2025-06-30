extends System


@export var canvas: Node2D
@export var asteroid_scene: PackedScene

func get_group():
	return QueryGroup.ASTEROID_DESTROYER


func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	
	for entity in entities:
		update(entity, _delta)


#render data point
func update(entity, _delta):
	var health_comp = entity.get_comp(Components.HEALTH)
	var render_comp = entity.get_comp(Components.POLYGON_RENDER)
	
	
	var shape_comp = entity.get_comp(Components.POLYGON_SHAPE)
	
	
	#TODO: add tag remove.
	# special system has to remove it
	if health_comp.value <= 0:
		if shape_comp.vertex_count > 6:
			create_asteroid(entity)
			create_asteroid(entity)
			
		var active_comp = Ecs.create_component(Components.DELETE)
		entity.add_component(active_comp)

		#canvas.remove_child(entity)
		#canvas.remove_child(render_comp.polygon)
		#render_comp.polygon.call_deferred("queue_free")
#		entity.call_deferred("queue_free")
		

func create_asteroid(from_entity):
	var new_entity = asteroid_scene.instantiate()
	canvas.add_child(new_entity)
	
	var parent_size = from_entity.get_comp(Components.SIZE)
	var position_comp = new_entity.get_comp(Components.POSITION)
	var movement_comp = new_entity.get_comp(Components.MOVEMENT)
	var shape_comp = new_entity.get_comp(Components.POLYGON_SHAPE)
	var size_comp = new_entity.get_comp(Components.SIZE)
	size_comp.size = Vector2(parent_size.size / 2)
	# Copy position from the destroyed asteroid
	position_comp.position = from_entity.get_comp(Components.POSITION).position
	
	# Set random direction and speed for the new asteroid
	var random_angle = randf_range(0, 2 * PI)
	movement_comp.direction = Vector2(cos(random_angle), sin(random_angle))
	movement_comp.speed = randf_range(50, 100) # Adjust speed range as needed

	var impulse_comp = Ecs.create_component(Components.IMPULSE)
	impulse_comp.direction = Vector2(cos(random_angle), sin(random_angle))
	impulse_comp.speed = randf_range(500, 1000) # Adjust speed range as needed
	new_entity.add_component(impulse_comp)

	# Make the new asteroid smaller
	shape_comp.vertex_count = min(6, from_entity.get_comp(Components.POLYGON_SHAPE).vertex_count - 2)
	
