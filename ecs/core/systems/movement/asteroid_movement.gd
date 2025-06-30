extends System

@export var canvas:Node2D
#var group = QueryGroup.ASTEROID_MOVE
func get_group():
	return QueryGroup.ASTEROID_MOVE


var off_set = 100
var bound: Rect2 = Rect2(-off_set, -off_set, Ecs.canvas_width + off_set, Ecs.canvas_height + off_set)

# Dictionary to store target points for each entity
var entity_targets = {}

func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	
	for entity in entities:
		update(entity, _delta)

func get_random_point_in_bounds() -> Vector2:
	var x = randf_range(bound.position.x, bound.position.x + bound.size.x)
	var y = randf_range(bound.position.y, bound.position.y + bound.size.y)
	return Vector2(x, y)

#render data point
func update(entity, _delta):
	var position_comp = entity.get_comp(Components.POSITION)
	#var movement_comp = entity.get_comp(Components.MOVEMENT)
	
	if bound.has_point(position_comp.position) == false:
		var render_comp = entity.get_comp(Components.POLYGON_RENDER)
		canvas.remove_child(entity)
		canvas.remove_child(render_comp.polygon)
		render_comp.polygon.call_deferred("queue_free")

	
		# When out of bounds, calculate direction to a random point inside bounds
		
		#var target = get_random_point_in_bounds()
		#var direction = (target - position_comp.position).normalized()
		#movement_comp.direction = direction
	
	# Update position
	#position_comp.position += movement_comp.direction * movement_comp.speed * _delta
