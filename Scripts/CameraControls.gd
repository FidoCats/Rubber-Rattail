extends Camera2D



@export var PositionClamp: Vector2 = Vector2(100.0, -100.0)
@export var ZoomClamp: float = 50



func _unhandled_input(_event: InputEvent) -> void:
	if _event is InputEventMouseMotion:
		if Input.is_action_pressed("MMB"):
			if position < PositionClamp and position > -PositionClamp:
				position -= _event.relative
			else:
				position = Vector2(0.0, 0.0)
	
	$Label.text = str(position)
	
	if Input.is_action_just_pressed("WheelUp"):
		if zoom < Vector2(ZoomClamp,ZoomClamp):
			zoom += Vector2(1,1)
			if zoom == Vector2(0,0):
				zoom += Vector2(1,1)
	if Input.is_action_just_pressed("WheelDown"):
		if zoom > Vector2(-ZoomClamp,-ZoomClamp):
			zoom -= Vector2(1,1)
			if zoom == Vector2(0,0):
				zoom -= Vector2(1,1)
