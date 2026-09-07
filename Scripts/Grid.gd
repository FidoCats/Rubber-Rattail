extends Node2D
class_name Grid2D



@export var CellSizeX: float = 10
@export var CellSizeY: float = 10
@export var GridSizeX: int = 5
@export var GridSizeY: int = 5
@export var CellPath: String = "res://Scenes/GridCell.tscn"
@export var CellImage: String = "res://Stuff/Images/icon.svg"
@export var Parent: Node2D



func _ready() -> void:
	if Parent == null:
		Parent = get_parent()
	
	var CurrentCell: int = 0
	while CurrentCell < (GridSizeX + 1):
		CurrentCell += 1
		position.x += CellSizeX
		for i in CellSizeY:
			var CellScene: PackedScene = load(str(CellPath))
			var Cell = CellScene.instantiate()
			add_child(Cell)
			Cell.scale.x = CellSizeX * 0.01
			Cell.scale.y = CellSizeY * 0.01
			Cell.texture = load(str(CellImage))
			position.y += CellSizeY
		position.y = 0.0



func get_position_on_grid(Position: Vector2) -> Vector2i:
	return Vector2i(Position * CellSizeX)
