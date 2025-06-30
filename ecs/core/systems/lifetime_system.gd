extends System


@export var canvas: Node2D

func get_group():
	return QueryGroup.LIFE_TIME


func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	for entity in entities:
		update(entity, _delta)


#render data point
func update(entity, _delta):
	#var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)
	var life_time_comp = entity.get_comp(Components.LIFE_TIME)
	
	# Check if required component exists
	if life_time_comp == null:
		return
	
	life_time_comp.time -= _delta
	#print("timer: "+str(timer_comp.current_time))
	if life_time_comp.time <= 0:
		var del_comp = Ecs.create_component(Components.DELETE)
		entity.add_component(del_comp)
		
	
		#destroy(entity)
