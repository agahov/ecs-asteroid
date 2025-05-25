extends System

#var group = QueryGroup.COLLIDE_DATA

@export var canvas: Node2D


func get_group():
	return QueryGroup.COLLIDE_DATA





		
func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group) 
	
	# Process each entity
	for entity in entities:
		update(entity,_delta)



func update(entity, _delta):

	var position_comp = entity.get_comp(Components.POSITION)
	var polygon_comp = entity.get_comp(Components.POLYGON_RENDER)
	
	var collide_comp = entity.get_comp(Components.COLLIDER)
	
	

	#collide_comp.area2D.position = position_comp.position+Vector2(10,10)
	collide_comp.area2D.global_position = position_comp.position+Vector2(10,10)
	
	  
	#collide_comp.area2D.position = position_comp.position
	if polygon_comp.is_changed:  
		collide_comp.collision_polygon.polygon = polygon_comp.render_points
		polygon_comp.is_changed = false
	
	
