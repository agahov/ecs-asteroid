extends Component


@export var color: Color
@export var default_color: Color

func _ready() -> void:
	if not default_color:
		default_color = color
	_comp_type = Components.STYLE
