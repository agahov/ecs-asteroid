extends Node

#var QueryGroup = load("res://ecs/types/query-group.gd")
#var Components = load("res://ecs/types/components.gd")
var canvas_width = 1280
var canvas_height = 760
#ecs
enum LoggerDomain {CORE_ERROR}

enum Shape {RECT, CIRCLE, TRIANGL}

var group_components = {
	QueryGroup.ADDED: [Components.POLYGON_RENDER, Components.OUT_OF_STAGE],
	QueryGroup.RENDERABL: [Components.POSITION, Components.POLYGON_RENDER, Components.STYLE],
	QueryGroup.INPUT_MOVE: [Components.INPUT_MOVEMENT],
	QueryGroup.MOVEABLE: [Components.MOVEMENT, Components.POSITION],
	QueryGroup.IMPULSEABLE: [Components.MOVEMENT, Components.IMPULSE],
	QueryGroup.DUMPABLE: [Components.MOVEMENT, Components.DUMPING],
	
	QueryGroup.TIME_ACTIVATE: [Components.TIMER],
	QueryGroup.LIFE_TIME: [Components.LIFE_TIME],
	QueryGroup.DEATH: [Components.HEALTH], # ACTIVE?
	QueryGroup.ASTEROID_CREATOR: [Components.ASTEROID, Components.BUILDER, Components.ACTIVE, ],
	QueryGroup.ASTEROID_DESTROYER: [Components.ASTEROID, Components.HEALTH, ],
	QueryGroup.ASTEROID_MOVE: [Components.ASTEROID, Components.MOVEMENT, Components.POSITION],
	QueryGroup.ASTEROID_DEMAGE: [Components.ASTEROID, Components.DAMAGE],
	#TODO: extract polygon_data to comp
	QueryGroup.COLLIDE_DATA: [Components.COLLIDER, Components.POSITION, Components.POLYGON_RENDER, ],
	QueryGroup.HITTER: [Components.COLLIDER, Components.HIT],
	QueryGroup.DAMAGEABLE: [Components.DAMAGE, Components.HEALTH, Components.STYLE],
	QueryGroup.POLYGON_UPDATE: [Components.POLYGON_RENDER, Components.POLYGON_SHAPE, Components.SIZE],
	
	QueryGroup.DELETE: [Components.DELETE], # ACTIVE?
	
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
	Loggie.msg("comp_type not found", component_name).domain("CORE_ERROR").error()
	return null

# Get all registered component types
func get_registered_components() -> Array:
	return _component_types.keys()

# Initialize component types
func _ready():
	# Register all component types
	register_component_type(Components.POSITION,
	 load("res://ecs/core/components/position.gd"))
	register_component_type(Components.STYLE,
	 load("res://ecs/core/components/style.gd"))
	register_component_type(Components.POLYGON_RENDER,
	 load("res://ecs/core/components/polygon_render.gd"))
	register_component_type(Components.OUT_OF_STAGE,
	 load("res://ecs/core/components/out_of_stage.gd"))
	register_component_type(Components.INPUT_MOVEMENT,
	 load("res://ecs/core/components/input_movement.gd"))
	register_component_type(Components.MOVEMENT,
	 load("res://ecs/core/components/movement.gd"))
	register_component_type(Components.IMPULSE,
	 load("res://ecs/core/components/impulse.gd"))
	register_component_type(Components.TIMER,
	 load("res://ecs/core/components/timer.gd"))
	register_component_type(Components.LIFE_TIME,
	 load("res://ecs/core/components/life_time.gd"))
	register_component_type(Components.ASTEROID,
	 load("res://ecs/core/components/asteroid.gd"))
	register_component_type(Components.SHIP,
	 load("res://ecs/core/components/ship.gd"))
	register_component_type(Components.BUILDER,
	 load("res://ecs/core/components/builder.gd"))
	register_component_type(Components.ACTIVE,
	 load("res://ecs/core/components/active.gd"))
	register_component_type(Components.HIT,
	 load("res://ecs/core/components/hit.gd"))
	register_component_type(Components.DAMAGE,
	 load("res://ecs/core/components/damage.gd"))
	register_component_type(Components.COLLIDER,
	 load("res://ecs/core/components/collision/collider.gd"))
	register_component_type(Components.ADD,
	 load("res://ecs/core/components/add_triger.gd"))
	register_component_type(Components.REMOVE,
	 load("res://ecs/core/components/remove_triger.gd"))
	register_component_type(Components.DELETE,
	 load("res://ecs/core/components/delete.gd"))
	register_component_type(Components.DUMPING,
	 load("res://ecs/core/components/dumping.gd"))
