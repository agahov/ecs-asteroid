extends System


var group = QueryGroup.ASTEROID_MOVE

var off_set = 100
var bound:Rect2 = Rect2(-off_set,-off_set, Ecs.canvas_width+off_set, Ecs.canvas_height+off_set)

func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group) 
	
	# Process each entity
	
	for entity in entities:
		update(entity,_delta)


#render data point
func update(entity, _delta):

	var position_comp = entity.get_comp(Components.POSITION)
	
	if 	bound.has_point(position_comp.position)== false:
		var movement_comp = entity.get_comp(Components.MOVEMENT)
		movement_comp.direction *=-1 
	

	#position_comp.position += movement_comp.direction * movement_comp.speed *_delta
	
	
