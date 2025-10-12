class_name CharacterData extends Node

var character_id: int = GlobalId.generate() 
@export var first_name: String
@export var last_name: String
@export var title: CharacterTitle
@export var health: int
@export var speed: float
@export var jump_speed: float

static func create(first: String, last: String, t: CharacterTitle) -> CharacterData:
	var character = new()
	character.first_name = first
	character.last_name = last
	character.title = t
	character.health = 5
	character.speed = 250.0
	character.jump_speed = 500.0
	return character

func full_name() -> String:
	return title.formatted_prefix() + first_name + ' ' + last_name + title.formatted_suffix()
	
