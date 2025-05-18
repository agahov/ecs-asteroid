extends GdUnitTestSuite

var _ecs: Node
var _entity: Entity

func before():
	_ecs = auto_free(Node.new())
	_ecs.set_script(load("res://ecs/ecs.gd"))
	add_child(_ecs)
	
	_entity = auto_free(Entity.new())
	add_child(_entity)

func test_add_to_group_when_all_components_present():
	# Given
	var position_comp = _ecs.create_component(Ecs.to_s(Ecs.Components, Ecs.Components.POSITION))
	var render_comp = _ecs.create_component(Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER))
	
	# When
	_entity.add_component(position_comp)
	_entity.add_component(render_comp)
	
	# Then
	assert_that(_entity.is_in_group(Ecs.to_s(Ecs.QueryGroup, Ecs.QueryGroup.RENDERABL))).is_true()

func test_remove_from_group_when_component_missing():
	# Given
	var position_comp = _ecs.create_component(Ecs.to_s(Ecs.Components, Ecs.Components.POSITION))
	var render_comp = _ecs.create_component(Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER))
	
	# When
	_entity.add_component(position_comp)
	_entity.add_component(render_comp)
	_entity.remove_component(render_comp)
	
	# Then
	assert_that(_entity.is_in_group(Ecs.to_s(Ecs.QueryGroup, Ecs.QueryGroup.RENDERABL))).is_false()

func test_update_group_when_components_change():
	# Given
	var position_comp = _ecs.create_component(Ecs.to_s(Ecs.Components, Ecs.Components.POSITION))
	var render_comp = _ecs.create_component(Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER))
	
	# When
	_entity.add_component(position_comp)
	assert_that(_entity.is_in_group(Ecs.to_s(Ecs.QueryGroup, Ecs.QueryGroup.RENDERABL))).is_false()
	
	# Then
	_entity.add_component(render_comp)
	assert_that(_entity.is_in_group(Ecs.to_s(Ecs.QueryGroup, Ecs.QueryGroup.RENDERABL))).is_true()
