extends System

var group = QueryGroup.RENDERABL

@export var canvas: Node2D

func _ready() -> void:

	print("movment system")


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
		update(entity,_delta)


#render data point
func update(entity, _delta):
	#??? position 
	#var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)

	var position_comp = entity.get_comp(Components.POSITION)
	var movement_comp = entity.get_comp(Components.MOVEMENT)
	

	position_comp.position += movement_comp.direction * movement_comp.speed *_delta
	
	
