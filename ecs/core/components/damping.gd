extends Component


var factor: float = 0.98
@export var curve:Curve = preload("res://resources/damping_curve.tres")
var elapsed_time: float
@export var total_time: float = 1.0

func _init() -> void:
	comp_type = Components.DAMPING
