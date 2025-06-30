extends System


func get_group():
	return QueryGroup.RENDERABL
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

		# Check if required components exist
		if polygon_comp == null or position_comp == null or style_comp == null:
			continue

		#TODO separate postion and form
		polygon_comp.polygon.position = position_comp.position
		
		if polygon_comp.is_changed:
			polygon_comp.polygon.polygon = polygon_comp.render_points
		polygon_comp.polygon.color = style_comp.color
		
		
		# or in every data comp add is_changed flag and set for every props
