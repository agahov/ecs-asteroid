extends Component


@export var position: Vector2

@export var direction: Vector2 = Vector2.RIGHT

func _init() -> void:
	comp_type = Components.POSITION
