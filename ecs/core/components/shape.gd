extends Component

@export var shape: Types.Shape

@export var vertex: int = 4

func _ready() -> void:
	_comp_type = Components.POLYGON_SHAPE
