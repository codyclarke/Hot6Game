extends CharacterBody2D

@onready var stage = $"../"

@export var character_state: CharacterState = PlayerState.new().generate()
@export var projectile: PackedScene = preload("res://scenes/projectile.tscn")

var character_direction :float = 0.0
func _init() -> void:
	pass
	
func _ready() -> void:
	var name_label = Label.new()
	name_label.text = character_state.full_name()
	name_label.position = Vector2(0, -($Sprite2D.get_rect().size.y/2)*$Sprite2D.scale.y-20.0)
	print(($Sprite2D.get_rect().size.y/2)*$Sprite2D.scale.y)
	add_child(name_label)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		spawn_projectile()

func _physics_process(delta: float) -> void:
	move_and_slide()
	character_direction = Input.get_axis("move_left", "move_right")
	if !is_on_floor():
		velocity.y = min(velocity.y + stage.gravity, stage.max_velocity)
	if( character_direction<0):
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	position.x = lerp(position.x, position.x + character_state.speed * character_direction,delta)
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		velocity.y = character_state.jump_speed * -1

func spawn_projectile():
	var bang = projectile.instantiate()
	bang.position = position
	bang.scale *= 1.0-(randf()*0.2)-0.1
	bang.direction = character_direction
	if bang.direction < 0:
		bang.get_child(0).flip_h = true
	owner.add_child(bang)
