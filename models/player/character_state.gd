class_name CharacterState extends Node

@export var first_name: String
@export var last_name: String
@export var title: CharacterClass
@export var health: int
@export var speed: float
@export var jump_speed: float

static func create(first: String, last: String, title: CharacterClass) -> CharacterState:
	var character = new()
	character.first_name = first
	character.last_name = last
	character.title = title
	character.health = 5
	character.speed = 250.0
	character.jump_speed = 500.0
	return character

func full_name() -> String:
	return title.formatted_prefix() + first_name + ' ' + last_name + title.formatted_suffix()
	
