extends System



var queary_group

var group = Ecs.QueryGroup.ADDED

@export var canvas: Node2D

func _ready() -> void:
	pass
	print("render")



		
		
func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(Ecs.to_s(Ecs.QueryGroup, group)) 
	
	var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)
	# Process each entity
	for entity in entities:
		print("add to Stage")
		var polygon_comp = entity.get_comp(poly_comp_name)

		canvas.add_child(polygon_comp.polygon)
		entity.remove_component_by_name(Ecs.to_s(Ecs.Components, Ecs.Components.ADD))



	
	
