extends System


@export var canvas: Node2D

func get_group():
	return QueryGroup.DELETE
	
func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
		
	for entity in entities:
		update(entity, _delta)


#render data point
func update(entity, _delta):
	#var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)
	delete(entity)

	
func delete(entity):
	var render_comp = entity.get_comp(Components.POLYGON_RENDER)
	
	if render_comp:
		canvas.remove_child(render_comp.polygon)
		render_comp.polygon.queue_free()

	if entity.get_parent() is Entity:
		var parent_entity = entity.get_parent()
		parent_entity.remove_component(entity)
		#entity.queue_free()
	else:

		canvas.remove_child(entity)
	entity.queue_free()
