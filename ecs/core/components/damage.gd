extends Component


@export var value: float = 100
@export var life_time: float = 1.0
var time: float = 0



func _ready() -> void:
	_comp_type = Components.DAMAGE
