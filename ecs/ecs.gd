extends Node

#var QueryGroup = load("res://ecs/types/query-group.gd")
#var Components = load("res://ecs/types/components.gd")

#ecs
enum LoggerDomain {CORE_ERROR}

var group_components = {
	QueryGroup.ADDED: [Components.POLYGON_RENDER, Components.OUT_OF_STAGE],
	QueryGroup.RENDERABL: [Components.POSITION, Components.POLYGON_RENDER],
	QueryGroup.INPUT_MOVE: [Components.INPUT_MOVEMENT],
	QueryGroup.MOVEABLE: [Components.MOVEMENT, Components.POSITION],
}

var _component_types = {}
func register_component_type(component_name: String, component_script: Script) -> void:
	_component_types[component_name] = component_script

# Create a new component instance
func create_component(component_name: String) -> Component:
	var component_script = _component_types.get(component_name)
	if component_script:
		var component = component_script.new()
		return component
	Loggie.msg("comp_type not found", component_name).domain(Ecs.to_s(Ecs.LoggerDomain,
	 Ecs.LoggerDomain.CORE_ERROR)).error()
	return null

# Get all registered component types
func get_registered_components() -> Array:
	return _component_types.keys()

# Initialize component types
func _ready():
	# Register all component types
	register_component_type(Components.POSITION,
	 load("res://ecs/core/components/position.gd"))
	register_component_type(Components.POLYGON_RENDER,
	 load("res://ecs/core/components/polygon-render.gd"))
