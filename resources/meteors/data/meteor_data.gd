extends Resource
class_name Meteor_Data

@export var speed: float
@export var texture: Texture2D

func move_meteor(meteor, delta: float) -> void:
	meteor.position.y += speed * delta
