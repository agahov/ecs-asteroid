extends System





var group = QueryGroup.INPUT_MOVE


func _ready() -> void:
	print("Input system")



		
func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group) 
	
	# Process each entity
	for entity in entities:
		update(entity, _delta)


#render data point
func update(entity, _delta):
	
	
	var movement_comp = entity.get_comp(Components.MOVEMENT)
	
	
	movement_comp.direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#print("move direction: "+str(movement_comp.direction))
	
