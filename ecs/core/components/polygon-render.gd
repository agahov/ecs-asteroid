extends Component

class_name PolygonRender


@export var render_points: PackedVector2Array # points
var polygon: Polygon2D = Polygon2D.new()
var is_changed: bool = true




func _ready() -> void:
	_comp_type = Ecs.Components.POLYGON_RENDER
