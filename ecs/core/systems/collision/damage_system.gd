extends System



@export var canvas: Node2D

func get_group():
	return QueryGroup.DAMAGEABLE




		
func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group) 
	
	# Process each entity
	for entity in entities:
		update(entity,_delta)


#render data point
func update(entity, _delta):
	var damage_comp = entity.get_comp(Components.DAMAGE)
	var health_comp = entity.get_comp(Components.HEALTH)
	var style_comp = entity.get_comp(Components.STYLE)
	
	health_comp.value-=damage_comp.value*_delta
	damage_comp.time +=_delta
	
	style_comp.color = Color.BLACK
	
	if damage_comp.time > damage_comp.life_time:
		style_comp.color = style_comp.default_color
		entity.remove_component(damage_comp)
	
	#var active_

	
	
	
