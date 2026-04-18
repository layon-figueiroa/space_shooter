extends CharacterBody2D

@onready var top_gun: Marker2D = $TopGun

@export var bullet_scene: PackedScene

@export var speed: float = 400.0
@export var acceleration: float = 0.2

var can_shoot: bool = true
var limits: Dictionary = {
	"top": 21.0,
	"bottom": 490.0,
	"left": 31.0,
	"right": 330.0
}

func _physics_process(_delta: float) -> void:
	move_player()
	limit_movement()
	shoot()

func move_player() -> void:
	var move: Vector2 = get_input()
	
	if move == Vector2.ZERO:
		velocity = velocity.lerp(Vector2.ZERO, acceleration)
	else:
		velocity = velocity.lerp(move * speed, acceleration)
	
	move_and_slide()
	
func limit_movement() -> void:
	position.x = clamp(position.x, limits["left"], limits["right"])
	position.y = clamp(position.y, limits["top"], limits["bottom"])

func get_input() -> Vector2:
	return Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()
	
func shoot() -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot:
		can_shoot = false
		
		var bullet = bullet_scene.instantiate()
		bullet.global_position = top_gun.global_position
		get_tree().current_scene.add_child(bullet)
		
		await get_tree().create_timer(0.5).timeout
		can_shoot = true
