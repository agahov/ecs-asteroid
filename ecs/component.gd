extends Node
class_name Component

var _comp_type: Ecs.Components


func _ready() -> void:
	if not _comp_type:
		Loggie.msg("_comp_type is null").domain(Ecs.to_s(Ecs.LoggerDomain, Ecs.LoggerDomain.CORE_ERROR)).error()


func get_comp_name() -> String:
	return Ecs.to_s(Ecs.Components, _comp_type)
