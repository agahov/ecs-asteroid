extends Component


@export var position: Vector2

@export var direction: Vector2 = Vector2.RIGHT

func _ready() -> void:
	_comp_type = Components.POSITION
