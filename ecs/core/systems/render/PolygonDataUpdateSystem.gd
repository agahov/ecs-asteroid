extends System





func get_group():
	return QueryGroup.POLYGON_UPDATE

func _process(_delta):
	
	# Get all entities in the moveable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	for entity in entities:
		data_gen(entity)


func data_gen(entity):

	var polygon_comp = entity.get_comp(Components.POLYGON_RENDER)
	var shap_comp = entity.get_comp(Components.POLYGON_SHAPE)
	#var position_comp = entity.get_comp(Components.POSITION)
	var size_comp = entity.get_comp(Components.SIZE)


	if polygon_comp.is_changed == false: return
	#var polygon = entity.c_polygon
	
	if shap_comp.shape == Types.Shape.RECT:
		polygon_comp.render_points = rectPoints(size_comp.size)
	elif shap_comp.shape == Types.Shape.CIRCLE:
		polygon_comp.render_points = circlePoints(size_comp.size)
	elif shap_comp.shape == Types.Shape.TRIANGL:
		polygon_comp.render_points = trianglPoints(size_comp.size)
	elif shap_comp.shape == Types.Shape.POLIGON:
		polygon_comp.render_points = polygonPoints(size_comp.size, shap_comp.vertex_count)

	
	#print("poligon points"+str(entity.c_render_points))
func rectPoints(size) -> PackedVector2Array:
	var w = size.x
	var h = size.y
	
	var points = PackedVector2Array([
		Vector2(-w / 2, -h / 2), # Top left
		Vector2(w / 2, -h / 2), # Top right
		Vector2(w / 2, h / 2), # Bottom right
		Vector2(-w / 2, h / 2) # Bottom left
	])
	return points
	
func circlePoints(size) -> PackedVector2Array:
	var radius = size.y / 2 # Using x as diameter, so radius is half
	var points = PackedVector2Array()
	var segments = 32 # Number of segments to approximate the circle
	
	for i in range(segments):
		var angle = (i * 2 * PI) / segments
		var x = radius * cos(angle)
		var y = radius * sin(angle)
		points.append(Vector2(x, y))
	
	return points
	
	
func polygonPoints(size, segments) -> PackedVector2Array:
	var radius = size.y # Using x as diameter, so radius is half
	var points = PackedVector2Array()
	#var segments = 32 # Number of segments to approximate the circle
	
	for i in range(segments):
		var angle = (i * 2 * PI) / segments
		var r = radius*(0.5+randf())
		var x = r * cos(angle)
		var y = r * sin(angle)
		points.append(Vector2(x, y))
	
	return points
	
	
func trianglPoints(size) -> PackedVector2Array:
	var width = size.x
	var height = size.y
	var points = PackedVector2Array()
	
	# Create an equilateral triangle pointing to the right
	points.append(Vector2(width / 2, 0)) # Point
	points.append(Vector2(-width / 2, height / 2)) # Bottom left
	points.append(Vector2(-width / 2, -height / 2)) # Top left
	
	return points
