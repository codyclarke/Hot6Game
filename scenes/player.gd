extends CharacterBody2D

@onready var stage = $"../"
var health: int = 5
var speed: float = 0.1
@export var jump_speed: float = 20.0

# when object is initialized
func _init() -> void:
	pass
	
# when object is loaded into a scene
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.x += speed * Input.get_axis("move_left", "move_right")
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed * -1
	
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	if !is_on_floor():
		velocity.y = min(velocity.y + stage.gravity, stage.max_velocity)
		print('velocity: ', velocity)
