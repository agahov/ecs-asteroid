extends Component


@onready var area2D = $Area2D
@onready var collision_polygon = $Area2D/CollisionPolygon2D

#var entity
var target


func _ready() -> void:
	_comp_type = Components.COLLIDER




func _on_area_2d_area_entered(area: Area2D) -> void:
	if not area:
		return
	target = area.get_parent().get_parent()	
	#print("Asteroid Entered by: ", target.name)
	
	
		
		
	
