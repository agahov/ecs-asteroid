extends Component


@export var time: float = 0.0
var current_time: float = 0.0

@export var repeate: int = 0

func _init() -> void:
	comp_type = Components.TIMER

func _ready() -> void:
	current_time = time
