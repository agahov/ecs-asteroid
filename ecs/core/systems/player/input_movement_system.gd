extends System



var queary_group

var group = QueryGroup.INPUT_MOVE

@export var canvas: Node2D

func _ready() -> void:
	pass
	print("render")


#func _activate() -> void:
	#
	#var entities = get_tree().get_nodes_in_group(group)
	#
	## Process each entity
	#for entity in entities:
		#canvas.add_child(entity.c_polygon)
		
		
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
	print("move direction: "+str(movement_comp.direction))
	#if Input.is_action_pressed("move_right"):
		#movement_comp.direction.x = 1
	#if Input.is_action_pressed("move_left"):
		#movement_comp.direction.x = -1
	#if Input.is_action_pressed("move_up"):
		#movement_comp.direction.y = -1
	#if Input.is_action_pressed("move_down"):
		#movement_comp.direction.x = 1
