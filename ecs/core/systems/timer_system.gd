extends System


func get_group():
	return QueryGroup.TIME_ACTIVATE




func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	for entity in entities:
		update(entity, _delta)


#render data point
func update(entity, _delta):
	#var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)
	var timer_comp = entity.get_comp(Components.TIMER)
	
	timer_comp.current_time -= _delta
	#print("timer: "+str(timer_comp.current_time))
	if timer_comp.current_time <= 0:
		trigger(entity, timer_comp)

	
func trigger(entity, timer_comp):
	#print(" ... fire time trigger")
	var active_comp = Ecs.create_component(Components.ACTIVE)
	
	entity.add_component(active_comp)
	timer_comp.current_time = timer_comp.time
	
	if timer_comp.repeate == -1:
		return
	
	
	timer_comp.repeate -= 1
	
		
	if timer_comp.repeate == 0:
		entity.remove_component(timer_comp)
		#entity.remove_component(Components.TIMER)
