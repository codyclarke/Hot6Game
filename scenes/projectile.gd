extends Area2D

@export var speed: int = 350
@export var rotation_degrees_per_second: float = 360
@export var projectile_screen_buffer: int = 20
@export var direction : int

@onready var _normal_position: Vector2 = position
@onready var camera: Camera2D = $"../Camera2D"
func _ready() -> void:
	if direction == 0: direction = 1
func _physics_process(delta: float) -> void:
	_normal_position = Vector2(_normal_position.x + (speed * delta *direction), _normal_position.y)
	position.x = _normal_position.x + randi_range(-5, 5)
	position.y = _normal_position.y + randi_range(-5, 5)
	#checks width of the current viewport, and checks if projectile is outside of camera area.
	if position.x > camera.get_viewport().size.x/2+camera.position.x + projectile_screen_buffer:
		remove_projectile()

func remove_projectile():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "TileMapLayer" || body.collision_layer == 3):
		$Sprite2D.play("flame_hit")
		speed = 0

func _on_sprite_2d_animation_finished() -> void:
	remove_projectile() # Replace with function body.
