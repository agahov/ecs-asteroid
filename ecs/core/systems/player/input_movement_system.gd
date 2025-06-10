extends System

@export var canvas: Node2D

@export var bullet_scence:PackedScene


#var group = 
func get_group():
	return QueryGroup.INPUT_MOVE

#TODO add comp direction to movement



func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	for entity in entities:
		update(entity, _delta)


#render data point
func update(entity, _delta):
	var movement_comp = entity.get_comp(Components.MOVEMENT)
	var position_comp = entity.get_comp(Components.POSITION)
	var size_comp = entity.get_comp(Components.SIZE)
	
	
	
	
	movement_comp.direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
		
	#print("move direction: "+str(movement_comp.direction))
# add tag comp create bullet
	if Input.is_action_just_pressed("fire"):
		var bullet_entity = bullet_scence.instantiate()
		#it is wrong, AddToStageSystem adding to canvas
		canvas.add_child(bullet_entity)
		var bullet_position_component = bullet_entity.get_comp(Components.POSITION)
		var bullet_movement_component = bullet_entity.get_comp(Components.MOVEMENT)
		#bullet_movement_component.direction = movement_comp.direction
		
		bullet_position_component.position = Vector2(position_comp.position) + position_comp.direction*size_comp.size.x
		bullet_movement_component.direction = Vector2(position_comp.direction)
 
