extends Node2D

@export var scroll_speed: float = 150.0

@onready var bg1: Sprite2D = $BG1
@onready var bg2: Sprite2D = $BG2

var texture_height: float

func _ready() -> void:
	texture_height = bg1.texture.get_size().y
	
func _process(delta: float) -> void:
	move_background(delta)
	
func move_background(delta: float) -> void:
	bg1.position.y += scroll_speed * delta
	bg2.position.y += scroll_speed * delta
	
	if bg1.position.y >= (texture_height + texture_height/2):
		bg1.position.y = bg2.position.y - texture_height
		
	if bg2.position.y >= (texture_height + texture_height/2):
		bg2.position.y = bg1.position.y - texture_height
