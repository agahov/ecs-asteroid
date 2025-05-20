extends Component


@export var direction:Vector2 = Vector2.ZERO

@export var speed:int = 0


func _ready() -> void:
	_comp_type = Components.MOVEMENT
