extends Area2D

@export var speed: float = 300.0

func _process(delta: float) -> void:
	move_bullet(delta)

func move_bullet(delta: float) -> void:
	position.y -= speed * delta
	
	
func _screen_exited() -> void:
	queue_free()
