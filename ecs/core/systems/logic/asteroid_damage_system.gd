extends System


@export var canvas: Node2D
#@export var asteroid_scene: PackedScene
@export var damage_comp: PackedScene


func get_group():
	return QueryGroup.ASTEROID_DEMAGE


func _process(_delta):
	# Get all entities in the renderable group
	var entities = get_tree().get_nodes_in_group(group)
	
	# Process each entity
	
	for entity in entities:
		update(entity, _delta)


#render data point
func update(entity, _delta):
	var health_comp = entity.get_comp(Components.HEALTH)
	var render_comp = entity.get_comp(Components.POLYGON_RENDER)
	var shape_comp = entity.get_comp(Components.POLYGON_SHAPE)
	var damage_comp = entity.get_comp(Components.DAMAGE)
	
	# Check if damage component exists
	if damage_comp == null:
		return
		
	if damage_comp.has_component_by_name(Components.ADD):
		onDamageAdded(entity, damage_comp)
		
	if damage_comp.has_component_by_name(Components.DELETE):
		onDamageDelete(entity, damage_comp)

	#if damage_comp.time > damage_comp.life_time:
		#style_comp.color = style_comp.default_color


"""
Problem that this events depends from DamageComp if i will remove damage_comp
they will not fire
"""

func onDamageAdded(entity, damage):
	var style_comp = entity.get_comp(Components.STYLE)
	if style_comp:
		style_comp.color = Color.CADET_BLUE
	damage.remove_component_by_name(Components.ADD)


#func onDamageRemoved(entity, damage):
func onDamageDelete(entity, damage):
	var style_comp = entity.get_comp(Components.STYLE)
	if style_comp:
		style_comp.color = style_comp.default_color
	#damage.remove_component_by_name(Components.REMOVE)
