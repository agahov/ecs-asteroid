extends System

#var group = QueryGroup.HITTER

@export var canvas: Node2D




func get_group():
	return QueryGroup.HITTER




#func _activate() -> void:
	#
	#var entities = get_tree().get_nodes_in_group(group)
	#
	## Process each entity
	#for entity in entities:
		#canvas.add_child(entity.c_polygon)
		
		
#func _process(_delta):
func _physics_process(delta: float) -> void:
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group) 
	
	# Process each entity
	for entity in entities:
		update(entity, delta)


#render data point
func update(entity, _delta):
	var collider_comp = entity.get_comp(Components.COLLIDER)
	var area2D:Area2D = collider_comp.area2D
	if not area2D.has_overlapping_areas():
		return
	var hit_comp = entity.get_comp(Components.HIT)
	#print("update on hit... ")	
	#TODO for? 	
	var targets = area2D.get_overlapping_areas()
	
	
	for target in targets:
		var target_entity = target.get_owner().get_owner()
		if target_entity:
			var damage_comp = entity.get_comp(Components.DAMAGE)
			if damage_comp:
				damage_comp.value += hit_comp.value
			else:	
				damage_comp = Ecs.create_component(Components.DAMAGE)
				damage_comp.value = hit_comp.value
				target_entity.add_component(damage_comp)
		else:
			print("Overlap comp has not parent")

		
	
	
	
	#var target_entity = collider_comp.area2D.get_owner()
	
	
	
	
	#var active_

	
	
	
