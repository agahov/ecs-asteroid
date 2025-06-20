extends Entity
class_name Component

var _comp_type: String

func _ready() -> void:
	super._ready()
	if not _comp_type:
		Loggie.msg("_comp_type is null").domain(Ecs.to_s(Ecs.LoggerDomain, Ecs.LoggerDomain.CORE_ERROR)).error()

func get_comp_name() -> String:
	return _comp_type

# Override to only count direct children (not nested components)
func _update_groups():
	# Components don't participate in group management for their nested components
	# Only the top-level entity should manage groups
	pass
