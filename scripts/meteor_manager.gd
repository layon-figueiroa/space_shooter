extends Node2D

@onready var timer: Timer = $Timer

@export var meteor_scene: PackedScene

var min_time: int = 2
var max_time: int = 4
var pos_y: float = -70.0
var min_pos_x: float = 31.0
var max_pos_x: float = 330.0
var spawn_position: Vector2

func _ready() -> void:
	timer.wait_time = randi_range(min_time, max_time)
	timer.start()

func generate_meteor() -> void:
	spawn_position = Vector2(randf_range(min_pos_x, max_pos_x), pos_y)
	
	var meteor = meteor_scene.instantiate()
	meteor.global_position = spawn_position
	
	get_tree().current_scene.add_child(meteor)
	

func _on_timer_timeout() -> void:
	generate_meteor()
	
	timer.wait_time = randi_range(min_time, max_time)
