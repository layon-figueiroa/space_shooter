extends CharacterBody2D

@export var speed: float = 400.0
@export var acceleration: float = 0.2

func _physics_process(_delta: float) -> void:
	move_player()

func move_player() -> void:
	var move: Vector2 = get_input()
	
	if move == Vector2.ZERO:
		velocity = velocity.lerp(Vector2.ZERO, acceleration)
	else:
		velocity = velocity.lerp(move * speed, acceleration)
	
	move_and_slide()

func get_input() -> Vector2:
	return Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()
