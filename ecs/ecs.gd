extends Node

#ecs
enum Shapes {CIRCLE, RECT, TRIANGL, POLIGON}
enum QueryGroup {ADDED, RENDERABL}
enum Components {POLYGON_RENDER, POSITION, ADD}
# logger
enum LoggerDomain {CORE_ERROR}

var group_components = {
	QueryGroup.ADDED: [Components.POLYGON_RENDER, Components.ADD],
	QueryGroup.RENDERABL: [Components.POSITION, Components.POLYGON_RENDER],
}


func to_s(e, enum_key) -> String:
	return e.keys()[enum_key]


var _component_types = {}
func register_component_type(component_name: String, component_script: Script) -> void:
	_component_types[component_name] = component_script

# Create a new component instance
func create_component(component_name: String) -> Component:
	var component_script = _component_types.get(component_name)
	if component_script:
		var component = component_script.new()
		return component
	#push_warning("Component type '%s' not found in factory" % component_name)
	#Loggie.msg("_comp_type is null").domain(Ecs.to_s(Ecs.LoggerDomain, Ecs.LoggerDomain.CORE_ERROR)).error()
	Loggie.msg("comp_type not found", component_name).domain(Ecs.to_s(Ecs.LoggerDomain,
	 Ecs.LoggerDomain.CORE_ERROR)).error()
	#push_warning("Component type '%s' not found in factory" % component_name)
	return null

# Get all registered component types
func get_registered_components() -> Array:
	return _component_types.keys()


# Initialize component types
func _ready():
	# Register all component types
	register_component_type(Ecs.to_s(Ecs.Components, Ecs.Components.POSITION),
	 preload("res://ecs/core/components/position.gd"))
	register_component_type(Ecs.to_s(Ecs.Components, Ecs.Components.POLYGON_RENDER),
	 preload("res://ecs/core/components/polygon-render.gd"))
