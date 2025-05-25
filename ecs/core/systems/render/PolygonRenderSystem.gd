extends System

var queary_group
var group = QueryGroup.RENDERABL



func _ready() -> void:
	pass
	print("render system")


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
		var polygon_comp = entity.get_comp(Components.POLYGON_RENDER)
		var position_comp = entity.get_comp(Components.POSITION)
		var style_comp = entity.get_comp(Components.STYLE)

#	var bg_color = entity.c_bg_color # from Size component
		polygon_comp.polygon.polygon = polygon_comp.render_points
		polygon_comp.polygon.position = position_comp.position
		polygon_comp.polygon.color = style_comp.color
	
