extends Area2D

@export var data: Meteor_Data

@onready var sprite: Sprite2D = $Sprite

var meteor_types: Array = [
	preload("res://resources/meteors/meteor_resources/brown_meteor.tres"),
	preload("res://resources/meteors/meteor_resources/gray_meteor.tres")
]

func _ready() -> void:
	data = meteor_types.pick_random()
	sprite.texture = data.texture
	
func _process(delta: float) -> void:
	data.move_meteor(self, delta)


func _on_screen_exited() -> void:
	queue_free()
