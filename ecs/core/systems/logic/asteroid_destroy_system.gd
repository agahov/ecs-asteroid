extends System


@export var canvas:Node2D


func get_group():
	return QueryGroup.ASTEROID_DESTROYER


func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group) 
	
	# Process each entity
	
	for entity in entities:
		update(entity,_delta)


#render data point
func update(entity, _delta):

	var health_comp = entity.get_comp(Components.HEALTH)
	var render_comp = entity.get_comp(Components.POLYGON_RENDER)
	
	
	#TODO: add tag remove.
	# special system has to remove it
	if health_comp.value<=0:
		canvas.remove_child(entity)
		canvas.remove_child(render_comp.polygon)
		render_comp.polygon.call_deferred("queue_free")
		entity.call_deferred("queue_free")
		
		
	

	#position_comp.position += movement_comp.direction * movement_comp.speed *_delta
	
