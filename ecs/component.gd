extends Entity
class_name Component

#var comp_type: String = "component"

func _ready() -> void:
	super._ready()
	if not comp_type:
		Loggie.msg("comp_type is null").domain(Ecs.to_s(Ecs.LoggerDomain, Ecs.LoggerDomain.CORE_ERROR)).error()

#func get_comp_name() -> String:
	#return comp_type

# Override to only count direct children (not nested components)
func _update_groups():
	# Components don't participate in group management for their nested components
	# Only the top-level entity should manage groups
	pass
