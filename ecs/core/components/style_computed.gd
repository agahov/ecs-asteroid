extends Component


@export var color: Color
@export var default_color: Color

#@export var value:Style


func _init() -> void:
	comp_type = Components.STYLE_COMPUTED

func _ready() -> void:
	if not default_color:
		default_color = color
