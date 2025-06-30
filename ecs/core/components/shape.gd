extends Component

@export var shape: Types.Shape

@export var vertex_count: int = 4

func _init() -> void:
	comp_type = Components.POLYGON_SHAPE
