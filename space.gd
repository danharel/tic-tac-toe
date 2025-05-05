class_name Space
extends Button

@export var row: int
@export var col: int
@export var state: State

func _ready() -> void:
	state = None.new()
	
func _process(delta: float) -> void:
	pass
