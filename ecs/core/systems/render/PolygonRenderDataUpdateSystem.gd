extends System



var queary_group

var group = Ecs.QueryGroup.RENDERABL

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
	var entities = get_tree().get_nodes_in_group(Ecs.to_s(Ecs.QueryGroup, group)) 
	
	# Process each entity
	for entity in entities:
		update(entity)


#render data point
func update(entity):
	#??? position 
	var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)
	var polygon_comp = entity.get_comp()
	polygon_comp.position = Vector2.ZERO
	#var size = entity.size # from Size component
	#if not entity.c_is_changed:
		#return

#	var bg_color = entity.c_bg_color # from Size component
	polygon_comp.polygon = polygon_comp.c_render_points
	polygon_comp.polygot.color = Color.RED
	#entity.c_is_changed = false
	
	
