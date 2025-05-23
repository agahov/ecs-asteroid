extends System


var queary_group

@export var entity_container: Node
var group = QueryGroup.ASTROID_CREATOR

#move to 
@export var asteroid_scene: PackedScene

@export var canvas: Node2D


var scen_width: int = 500
var scen_height: int = 500


func _ready() -> void:
	pass
	print("asteriod creator")


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
		create(entity, _delta)


#render data point

func create(entity, _delta):
	print("create asteroid")
	entity.remove_component_by_name(Components.ACTIVE)
	
	var builder_comp = entity.get_comp(Components.BUILDER)
	#??? position 
	#var poly_comp_name = Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER)
	var new_entity = asteroid_scene.instantiate()
	entity_container.add_child(new_entity)
	var position_comp = new_entity.get_comp(Components.POSITION)
	var movement_comp = new_entity.get_comp(Components.MOVEMENT)
	
	#to do rnd logic
	#var pos: Vector2 = Vector2(0, scen_width * randf())
	
	var pos = get_rnd_position(builder_comp.area)
	position_comp.position = pos
	var target = Vector2(scen_width*randf(), scen_height*randf())
	#var center = Vector2(scen_width, scen_height) / 2
	movement_comp.direction = pos.direction_to(target)


func get_rnd_position(area: Rect2) -> Vector2:
	var pos: Vector2 = Vector2(area.position.x+area.size.x * randf(),area.position.y + area.size.y * randf())
	return pos
