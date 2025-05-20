extends GdUnitTestSuite

var QueryGroup = load("res://ecs/types/query-group.gd")
var Components = load("res://ecs/types/components.gd")

var _ecs: Node
var _entities = []

func before():
	_ecs = Ecs
	print("Before: ", get_child_count())

func after():
	for entity in _entities:
		remove_child(entity)
		entity.queue_free()
	_entities.clear()
	print("After: ", get_child_count())

func test_add_components():
	var entity = Entity.new()
	add_child(entity)
	_entities.append(entity)
	
	var position_comp = _ecs.create_component(Components.POSITION)
	var render_comp = _ecs.create_component(Components.POLYGON_RENDER)
	
	entity.add_component(position_comp)
	entity.add_component(render_comp)
	
	assert_that(entity.is_in_group(QueryGroup.RENDERABL)).is_true()

func test_remove_component():
	var entity = Entity.new()
	add_child(entity)
	_entities.append(entity)
	
	var position_comp = _ecs.create_component(Components.POSITION)
	var render_comp = _ecs.create_component(Components.POLYGON_RENDER)
	
	entity.add_component(position_comp)
	entity.add_component(render_comp)
	
	entity.remove_component(position_comp)
	
	assert_that(entity.is_in_group(QueryGroup.RENDERABL)).is_false()

func test_add_remove_component():
	var entity = Entity.new()
	add_child(entity)
	_entities.append(entity)
	
	var position_comp = _ecs.create_component(Components.POSITION)
	var render_comp = _ecs.create_component(Components.POLYGON_RENDER)
	
	entity.add_component(position_comp)
	entity.add_component(render_comp)
	
	assert_that(entity.is_in_group(QueryGroup.RENDERABL)).is_true()
	
	entity.remove_component(position_comp)
	
	assert_that(entity.is_in_group(QueryGroup.RENDERABL)).is_false()
