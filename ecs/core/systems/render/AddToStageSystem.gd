extends System

var queary_group
var group = QueryGroup.ADDED

@export var canvas: Node2D

func _ready() -> void:
	pass
	print("add to stage system")

func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	for entity in entities:
		#print("add to Stage")
		var polygon_comp = entity.get_comp(Components.POLYGON_RENDER)

		canvas.add_child(polygon_comp.polygon)
		
		
		#canvas.add_child(entity)
		entity.remove_component_by_name(Components.OUT_OF_STAGE)
		
		#TODO
		#var collide_comp = entity.get_comp(Components.COLLIDER)
		#if collide_comp:
			#canvas.add_child(collide_comp.area2D)
			
		
		
